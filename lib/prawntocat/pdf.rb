require "prawn"
require "prawntocat/issues"

module Prawntocat
  class PDF
    def initialize repo, pdf_name
      @repo = repo
      @pdf_name = pdf_name || repo.gsub("/", "_").+(".pdf")
    end

    def issues
      @issues ||= Prawntocat::Issues.new(@repo)
    end

    def generate
      Prawn::Document.generate(@pdf_name) do |doc|
        doc.text("Issues for #{@repo}", size: 20)
        doc.move_down 20
        issues.each do |issue|
          doc.text("<b>#{issue.title}</b>\n")
        end
        doc.move_down 1
      end
    end
  end
end
