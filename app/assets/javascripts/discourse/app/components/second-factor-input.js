import Component from "@ember/component";
import { action } from "@ember/object";
import { SECOND_FACTOR_METHODS } from "discourse/models/user";
import discourseComputed from "discourse-common/utils/decorators";

export default Component.extend({
  @discourseComputed("secondFactorMethod")
  type(secondFactorMethod) {
    if (secondFactorMethod === SECOND_FACTOR_METHODS.TOTP) {
      return "tel";
    }
    if (secondFactorMethod === SECOND_FACTOR_METHODS.BACKUP_CODE) {
      return "text";
    }
  },

  @discourseComputed("secondFactorMethod")
  pattern(secondFactorMethod) {
    if (secondFactorMethod === SECOND_FACTOR_METHODS.TOTP) {
      return "[0-9]{6}";
    }
    if (secondFactorMethod === SECOND_FACTOR_METHODS.BACKUP_CODE) {
      return "[a-z0-9]{16}";
    }
  },

  @discourseComputed("secondFactorMethod")
  maxlength(secondFactorMethod) {
    if (secondFactorMethod === SECOND_FACTOR_METHODS.TOTP) {
      return "6";
    }
    if (secondFactorMethod === SECOND_FACTOR_METHODS.BACKUP_CODE) {
      return "32";
    }
  },

  @action
  onInput() {
    if (this.onTokenInput) {
      this.onTokenInput(...arguments);
    }
  },
});
