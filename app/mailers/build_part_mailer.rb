class BuildPartMailer < ActionMailer::Base
  helper :application
  TIMEOUT_EMAIL = 'build-and-release+timeouts@squareup.com'
  KOCHIKU_EMAIL = 'kochiku@squareup.com'

  default :from => KOCHIKU_EMAIL

  def time_out_email(build_part)
    @build_part = build_part
    @builder = build_part.build_attempts.last.builder
    mail(:to => TIMEOUT_EMAIL, :subject => "[kochiku] Build part timed out")
  end

  def build_break_email(emails, build)
    @build = build
    @git_changes = GitBlame.git_changes_since_last_green(@build)
    @failed_build_parts = @build.build_parts.failed_or_errored

    @emails = emails
    #TODO: only temporary for testing, we'll send to these emails once we're happy with the frequency and email formatting
    to = if @build.project.name == "web"
      emails
    else
      []
    end
    mail(:to => to,
         :bcc => ["nolan@squareup.com", "ssorrell@squareup.com", "cheister@squareup.com"],
         :subject => "[kochiku] #{@build.project.name.titleize} build failed")
  end
end
