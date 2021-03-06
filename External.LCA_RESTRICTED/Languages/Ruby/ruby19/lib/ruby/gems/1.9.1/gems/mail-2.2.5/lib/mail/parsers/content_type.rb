# Autogenerated from a Treetop grammar. Edits may be lost.


module Mail
  module ContentType
    include Treetop::Runtime

    def root
      @root ||= :content_type
    end

    include RFC2822

    include RFC2045

    module ContentType0
      def CFWS1
        elements[0]
      end

      def parameter
        elements[2]
      end

      def CFWS2
        elements[3]
      end
    end

    module ContentType1
      def main_type
        elements[0]
      end

      def sub_type
        elements[2]
      end

      def param_hashes
        elements[3]
      end
    end

    module ContentType2
      def parameters
        param_hashes.elements.map do |param|
          param.parameter.param_hash
        end
      end
    end

    def _nt_content_type
      start_index = index
      if node_cache[:content_type].has_key?(index)
        cached = node_cache[:content_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_main_type
      s0 << r1
      if r1
        if has_terminal?("/", false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("/")
          r2 = nil
        end
        s0 << r2
        if r2
          r3 = _nt_sub_type
          s0 << r3
          if r3
            s4, i4 = [], index
            loop do
              i5, s5 = index, []
              r6 = _nt_CFWS
              s5 << r6
              if r6
                if has_terminal?(";", false, index)
                  r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure(";")
                  r8 = nil
                end
                if r8
                  r7 = r8
                else
                  r7 = instantiate_node(SyntaxNode,input, index...index)
                end
                s5 << r7
                if r7
                  r9 = _nt_parameter
                  s5 << r9
                  if r9
                    r10 = _nt_CFWS
                    s5 << r10
                  end
                end
              end
              if s5.last
                r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
                r5.extend(ContentType0)
              else
                @index = i5
                r5 = nil
              end
              if r5
                s4 << r5
              else
                break
              end
            end
            r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
            s0 << r4
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ContentType1)
        r0.extend(ContentType2)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:content_type][start_index] = r0

      r0
    end

    def _nt_main_type
      start_index = index
      if node_cache[:main_type].has_key?(index)
        cached = node_cache[:main_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_discrete_type
      if r1
        r0 = r1
      else
        r2 = _nt_composite_type
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:main_type][start_index] = r0

      r0
    end

    def _nt_discrete_type
      start_index = index
      if node_cache[:discrete_type].has_key?(index)
        cached = node_cache[:discrete_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      if has_terminal?("text", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 4))
        @index += 4
      else
        terminal_parse_failure("text")
        r1 = nil
      end
      if r1
        r0 = r1
      else
        if has_terminal?("image", false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 5))
          @index += 5
        else
          terminal_parse_failure("image")
          r2 = nil
        end
        if r2
          r0 = r2
        else
          if has_terminal?("audio", false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 5))
            @index += 5
          else
            terminal_parse_failure("audio")
            r3 = nil
          end
          if r3
            r0 = r3
          else
            if has_terminal?("video", false, index)
              r4 = instantiate_node(SyntaxNode,input, index...(index + 5))
              @index += 5
            else
              terminal_parse_failure("video")
              r4 = nil
            end
            if r4
              r0 = r4
            else
              if has_terminal?("application", false, index)
                r5 = instantiate_node(SyntaxNode,input, index...(index + 11))
                @index += 11
              else
                terminal_parse_failure("application")
                r5 = nil
              end
              if r5
                r0 = r5
              else
                r6 = _nt_extension_token
                if r6
                  r0 = r6
                else
                  @index = i0
                  r0 = nil
                end
              end
            end
          end
        end
      end

      node_cache[:discrete_type][start_index] = r0

      r0
    end

    def _nt_composite_type
      start_index = index
      if node_cache[:composite_type].has_key?(index)
        cached = node_cache[:composite_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      if has_terminal?("message", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 7))
        @index += 7
      else
        terminal_parse_failure("message")
        r1 = nil
      end
      if r1
        r0 = r1
      else
        if has_terminal?("multipart", false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 9))
          @index += 9
        else
          terminal_parse_failure("multipart")
          r2 = nil
        end
        if r2
          r0 = r2
        else
          r3 = _nt_extension_token
          if r3
            r0 = r3
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:composite_type][start_index] = r0

      r0
    end

    def _nt_extension_token
      start_index = index
      if node_cache[:extension_token].has_key?(index)
        cached = node_cache[:extension_token][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_ietf_token
      if r1
        r0 = r1
      else
        r2 = _nt_custom_x_token
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:extension_token][start_index] = r0

      r0
    end

    def _nt_sub_type
      start_index = index
      if node_cache[:sub_type].has_key?(index)
        cached = node_cache[:sub_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_extension_token
      if r1
        r0 = r1
      else
        r2 = _nt_iana_token
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:sub_type][start_index] = r0

      r0
    end

    module Parameter0
      def attr
        elements[1]
      end

      def val
        elements[3]
      end

    end

    module Parameter1
      def param_hash
        {attr.text_value => val.text_value}
      end
    end

    def _nt_parameter
      start_index = index
      if node_cache[:parameter].has_key?(index)
        cached = node_cache[:parameter][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r2 = _nt_CFWS
      if r2
        r1 = r2
      else
        r1 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r1
      if r1
        r3 = _nt_attribute
        s0 << r3
        if r3
          if has_terminal?("=", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("=")
            r4 = nil
          end
          s0 << r4
          if r4
            r5 = _nt_value
            s0 << r5
            if r5
              r7 = _nt_CFWS
              if r7
                r6 = r7
              else
                r6 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r6
            end
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Parameter0)
        r0.extend(Parameter1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:parameter][start_index] = r0

      r0
    end

    def _nt_attribute
      start_index = index
      if node_cache[:attribute].has_key?(index)
        cached = node_cache[:attribute][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        r1 = _nt_token
        if r1
          s0 << r1
        else
          break
        end
      end
      if s0.empty?
        @index = i0
        r0 = nil
      else
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      end

      node_cache[:attribute][start_index] = r0

      r0
    end

    module Value0
      def text_value
        quoted_content.text_value
      end
    end

    def _nt_value
      start_index = index
      if node_cache[:value].has_key?(index)
        cached = node_cache[:value][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_quoted_string
      r1.extend(Value0)
      if r1
        r0 = r1
      else
        s2, i2 = [], index
        loop do
          i3 = index
          r4 = _nt_token
          if r4
            r3 = r4
          else
            if has_terminal?('\G[\\x3d]', true, index)
              r5 = true
              @index += 1
            else
              r5 = nil
            end
            if r5
              r3 = r5
            else
              @index = i3
              r3 = nil
            end
          end
          if r3
            s2 << r3
          else
            break
          end
        end
        if s2.empty?
          @index = i2
          r2 = nil
        else
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        end
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:value][start_index] = r0

      r0
    end

  end

  class ContentTypeParser < Treetop::Runtime::CompiledParser
    include ContentType
  end

end