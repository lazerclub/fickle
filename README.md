fickle
======
*Don't make up your mind.*

Fickle is a feature framework for rails 3. It is currently under heavy development and
is not stable in any sense of the word. Especially not the emotional sense.

Quickstart
----------

### Gemfile

    gem 'fickle'

### app/views/layouts/application.html.erb

    <%- if feature_enabled? :my_totally_sweet_feature %>
      <!--
        My totally sweet code
      -->
    <%- else %>
      <!--
        My slightly less sweet code
      -->
    <%- end %>

BUT! Fickle is designed to do more! Oh, so much more.

Advanced Features
-----------------

Let's say you want to limit features on a per-user basis.

### app/models/user.rb

    class User < ActiveRecord::Base
      
      has_featureset
      
    end
    
### app/controllers/experimental_controller.rb

    class ExperimentalController
    
      before_filter :authenticate
      
      def secret_feature
        status 404 and return unless current_user.has_feature? :my_secret_new_feature
        # Do secret stuff
      end
    
    end

You can also access this method in the views. Cause, you know, it's on the model.

Web Interface
-------------

Fickle includes a web interface for managing your features. You can globally turn features on and off,
and you can manage them on a model-by-model basis. You can even hardstop a feature if it starts causing
you trouble.

### config/routes.rb

    fickle_admin 'features', :restrict_on => :current_user
    
This will return a 404 unless `current_user.can_administer_fickle?`

Tips/tricks
-----------


Want a user who gets all the goodies? It's ruby!

### app/models/user.rb

    def has_feature?(feature)
      admin? || super
    end

Oh, snap that was easy.


    Copyright (c) 2011 chrisrhoden && lazerclub industries

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.