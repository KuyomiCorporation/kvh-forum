import Controller from "@ember/controller";
import { action } from "@ember/object";
import { not } from "@ember/object/computed";
import { ajax } from "discourse/lib/ajax";
import { propertyEqual } from "discourse/lib/computed";
import { bufferedProperty } from "discourse/mixins/buffered-content";

export default class AdminCustomizeRobotsTxtController extends Controller.extend(
  bufferedProperty("model")
) {
  saved = false;
  isSaving = false;

  @propertyEqual("model.robots_txt", "buffered.robots_txt") saveDisabled;

  @not("model.overridden") resetDisabled;

  @action
  save() {
    this.setProperties({
      isSaving: true,
      saved: false,
    });

    ajax("robots.json", {
      type: "PUT",
      data: { robots_txt: this.buffered.get("robots_txt") },
    })
      .then((data) => {
        this.commitBuffer();
        this.set("saved", true);
        this.set("model.overridden", data.overridden);
      })
      .finally(() => this.set("isSaving", false));
  }

  @action
  reset() {
    this.setProperties({
      isSaving: true,
      saved: false,
    });
    ajax("robots.json", { type: "DELETE" })
      .then((data) => {
        this.buffered.set("robots_txt", data.robots_txt);
        this.commitBuffer();
        this.set("saved", true);
        this.set("model.overridden", false);
      })
      .finally(() => this.set("isSaving", false));
  }
}
