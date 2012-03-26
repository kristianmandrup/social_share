module SocialShare
	module ViewHelpers
		def tag_facebook_like
			%q{<div id="fb-root"></div><div id="facebook">[Facebook]</div>}.html_safe
		end

		def facebook_like
    	content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&layout=standard&show_faces=true&width=450&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
    end	

    def twitter_share tweet, options = {}
    	size_attrib = options[:size] == :large ? %q{data-size="large"} : ""
    	lang_code = options[:lang] ? options[:lang].downcase : 'en'
  		%Q{<div class='twshare left'>  			
	<a href="http://twitter.com/share" class="twitter-share-button" data-count="horizontal" data-text="#{tweet}" data-related="#{options[:at]}" data-hashtags="#{options[:hashtags]}" #{size_attrib} data-lang="#{lang_code}">Tweet</a>
</div>}.html_safe
		end

		def twitter_mention tweet_to, text, options = {}
			%Q{<a href="https://twitter.com/intent/tweet?screen_name=#{CGI::escape(tweet_to)}&text=#{CGI::escape(text)}" class="twitter-mention-button" #{size_attrib} data-related="#{options[:at]}">Tweet to @#{tweet_to}</a>}
		end

		def twitter_hashtag hashtag, text, options = {}
    	size_attrib = options[:size] == :large ? %q{data-size="large"} : ""
    	lang_code = options[:lang] ? options[:lang].downcase : 'en'

			%Q{<a href="https://twitter.com/intent/tweet?button_hashtag=#{CGI::escape(hashtag)}&text=#{CGI::escape(text)}" class="twitter-hashtag-button" #{size_attrib} data-related="#{options[:at]}" data-lang="#{lang_code}">Tweet ##{hashtag}</a>}
		end

		def twitter_follow username, options = {}
    	size_attrib = options[:size] == :large ? %q{data-size="large"} : ""
    	lang_code = options[:lang] ? options[:lang].downcase : 'en'
			%Q{<a href="https://twitter.com/#{username}" class="twitter-follow-button" #{size_attrib} data-lang="#{lang_code} data-show-count="false">Follow @#{username}</a>}
		end

		def twitter_script
			content_for :javascript do
				twitter_script_js
			end
		end

		protected

		def twitter_script_js
			%q{<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>}.html_safe
		end
	end
end