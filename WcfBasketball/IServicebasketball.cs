using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfBasketball
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IServicebasketball
    {

        [OperationContract]
        string GetData(int value);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        // TODO: Add your service operations here
        [OperationContract]
        bool Validate(string username, string password);
        
        [OperationContract]
        string UpdateXmlStats(int GameId, string HomeXml, string AwayXml);
        [OperationContract]
        string SendXmltoDatabase(string HomeXml, string AwayXml);
        [OperationContract]
        DataTable GetTodayMatches();

        [OperationContract]
        DataTable GetHomeRoster(int GameId);
        [OperationContract]
        DataTable GetAwayRoster(int GameId); 
        }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
