xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title t("vestibule.proposals.feed.title")
    xml.description t("vestibule.proposals.feed.description")
    xml.link proposals_url
    xml.tag!('atom:link', href: proposals_url(format: 'rss'), rel: 'self', type: 'application/rss+xml')

    @proposals.each do |proposal|
      xml.item do
        xml.title proposal_title_for_rss(proposal)
        xml.description do
          xml.cdata! markdown proposal.description
        end
        xml.pubDate proposal.created_at.to_s(:rfc822)
        xml.link proposal_url(proposal)
        xml.guid proposal_url(proposal)
      end
    end
  end
end
