import { observes } from "@ember-decorators/object";
import { INPUT_DELAY } from "discourse-common/config/environment";
import discourseDebounce from "discourse-common/lib/debounce";
import AdminEmailLogsController from "admin/controllers/admin-email-logs";

export default class AdminEmailSentController extends AdminEmailLogsController {
  @observes("filter.{status,user,address,type,reply_key}")
  filterEmailLogs() {
    discourseDebounce(this, this.loadLogs, INPUT_DELAY);
  }
}
