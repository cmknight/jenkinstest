package com.asponte.customrendering;

import java.io.FileInputStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import com.ibm.workplace.wcm.api.plugin.rendering.RenderingPluginDefinition;
import com.ibm.workplace.wcm.api.plugin.rendering.RenderingPluginException;
import com.ibm.workplace.wcm.api.plugin.rendering.RenderingPluginModel;
import com.ibm.workplace.wcm.api.plugin.rendering.RenderingPluginParameter;
import com.ibm.workplace.wcm.api.plugin.rendering.RenderingPluginParameterAdapter;
import com.ibm.workplace.wcm.api.plugin.rendering.RenderingPluginParameterImpl;
import com.ibm.workplace.wcm.api.plugin.rendering.RenderingPluginType;
import com.ibm.workplace.wcm.api.plugin.rendering.RenderingPluginTypes;
import com.ibm.workplace.wcm.api.plugin.rendering.ValueOptionImpl;
import com.ibm.workplace.wcm.api.plugin.rendering.RenderingPluginParameter.Required;

public class AsponteReadProperty implements RenderingPluginDefinition
{
   private static final String CLASS_NAME = AsponteReadProperty.class.getName();

   private static final Logger s_log = Logger.getLogger(CLASS_NAME);
   // cmk testing
   private final String NAME = "AsponteReadProperty Plugin";

   private final String TITLE = "AsponteReadProperty plugin";

   private final String DESCRIPTION = "AsponteReadProperty is used to read the property passed from the property file passed";

   private final String PROP_FILE = "propertyFile";

   private final String PROP_NAME = "propertyName";

   @Override
   public String getDescription(Locale arg0)
   {
      // TODO Auto-generated method stub
      return NAME;
   }

   @Override
   public String getName()
   {
      // TODO Auto-generated method stub
      return NAME;
   }

   @Override
   public String getTitle(Locale arg0)
   {
      // TODO Auto-generated method stub
      return NAME;
   }

   @Override
   public boolean render(RenderingPluginModel renderingModel) throws RenderingPluginException
   {
      // TODO Auto-generated method stub
      boolean isDebug = s_log.isLoggable(Level.FINEST);
      if (isDebug)
      {
         s_log.entering("AsponteReadProperty", "render");
      }

      boolean successful = true;
      HttpServletRequest request = (HttpServletRequest) renderingModel.getRequest();
      Map<String, List<String>> params = renderingModel.getPluginParameters();
      List<String> list;
      try
      {
         String propFileName = null;
         String propToRetrieve = null;
         String propertyValue = null;
         list = params.get(PROP_FILE);
         if (list != null && list.size() > 0)
         {
            propFileName = list.get(0);
         }
         list = params.get(PROP_NAME);
         if (list != null && list.size() > 0)
         {
            propToRetrieve = list.get(0);
         }

         if (propToRetrieve == null || propToRetrieve.isEmpty())
         {

            successful = false;
            if (isDebug)
            {
               s_log.log(Level.FINEST, "propToRetrieve not correct");
            }
         }

         else if (propFileName == null || propFileName.isEmpty())
         {

            successful = false;
            if (isDebug)
            {
               s_log.log(Level.FINEST, "propFileName not correct");
            }
         }

         else
         {
            if (propFileName.equalsIgnoreCase("SYSTEM"))
            {
               propertyValue = System.getProperty(propToRetrieve);
               if (propertyValue != null && !propertyValue.isEmpty())
               {
                  if (isDebug)
                  {
                     s_log.log(Level.FINEST, "found value  " + propertyValue);
                  }

                  Writer out = renderingModel.getWriter();
                  out.append(propertyValue);
               }
               else
               {
                  if (isDebug)
                  {
                     s_log.log(Level.FINEST, "propToRetrieve not found for " + propToRetrieve + " in file " + propFileName);
                  }
               }
            }
            else
            {
               // try to get from the filesystem
               Properties props = new Properties();
               try
               {
                  props.load(new FileInputStream(propFileName));
                  propertyValue = props.getProperty(propToRetrieve);
                  if (propertyValue != null && !propertyValue.isEmpty())
                  {
                     if (isDebug)
                     {
                        s_log.log(Level.FINEST, "found value  " + propertyValue);
                     }
                     Writer out = renderingModel.getWriter();
                     out.append(propertyValue);
                  }
                  else
                  {
                     if (isDebug)
                     {
                        s_log.log(Level.FINEST, "propToRetrieve not found for " + propToRetrieve + " in file " + propFileName);
                     }
                  }
               }
               catch (Exception e)
               {
                  if (isDebug)
                  {
                     s_log.log(Level.FINEST, "Exception " + e.getMessage());
                     e.printStackTrace();
                  }
                  successful = false;
               }
            }
         }
      }

      catch (Exception e)
      {

      }
      if (isDebug)
      {
         s_log.exiting("AsponteReadProperty", "render");
      }

      return successful;
   }

   @Override
   public boolean isShownInAuthoringUI()
   {
      // TODO Auto-generated method stub
      return true;
   }

   @Override
   public List<RenderingPluginParameter> getParameters()
   {
      // TODO Auto-generated method stub
      // TODO Auto-generated method stub
      List<RenderingPluginParameter> parameters = new ArrayList<RenderingPluginParameter>();

      RenderingPluginParameterAdapter contextParam = new RenderingPluginParameterImpl(PROP_FILE).required(Required.REQUIRED).allowedValues(
         new ValueOptionImpl("File Name"));
      parameters.add(contextParam);

      RenderingPluginParameterAdapter libParam = new RenderingPluginParameterImpl(PROP_NAME).required(Required.REQUIRED).allowedValues(
         new ValueOptionImpl("Property Name"));
      parameters.add(libParam);

      return parameters;
   }

   @Override
   public RenderingPluginType getType()
   {
      // TODO Auto-generated method stub
      return RenderingPluginTypes.OTHER;
   }

}
