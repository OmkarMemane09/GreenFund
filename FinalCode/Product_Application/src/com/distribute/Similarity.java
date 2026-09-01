package com.distribute;

import java.sql.*;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.user.*;



public class Similarity {
	
	public static Map<Integer, Double> output = new HashMap<Integer, Double>();
	public static Map<Integer, String> dbquestion = new HashMap<Integer, String>();

	public static String chatbotprocess(String data)
	{
		output.clear();
		dbquestion.clear();
		String id="";
		RemoveStopwords r = new RemoveStopwords();
		try {
			String inputNeurons = r.RemoveWords(data);
			System.out.println("StopWords Data=>" + inputNeurons);
			Connection con = DBconn.conn();
			id = Classifier(inputNeurons.replace(",", " "), con);
			System.out.println("ID=>" + id);

		} catch (Exception  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	public static String Classifier(String inputNeurons, Connection con) {
		String msg = "";
		RemoveStopwords r = new RemoveStopwords();

		double weight = 0.0, Feedback = 0.0;

		try {
			Statement stScore = con.createStatement();
			ResultSet rsScore = stScore
					.executeQuery("select * from tblchatbot");

			while (rsScore.next()) {
				String HiddenNeuronsLayer = rsScore.getString("patterns");

				int id = rsScore.getInt("CID");

				dbquestion.put(id, HiddenNeuronsLayer);

			}
			Similarity cs = new Similarity();

			for (Entry<Integer, String> entry : dbquestion.entrySet()) { // Itrate
																			// through
																			// hashmap
				weight = 0.0;
				int id = entry.getKey();
				String[] values = entry.getValue().split(",");
				for (int i = 0; i < values.length; i++) {
					//
					String HNeurons = r.RemoveWords(values[i]);

					weight = weight
							+ cs.Getscore(inputNeurons.toLowerCase(),
									HNeurons.toLowerCase());

				}
				output.put(id, weight);
				System.out.println(weight + "\t ID=>" + id + "Data=>"
						+ entry.getValue());

			}
			double maxKey = Collections.max(output.values());

			for (Entry<Integer, Double> entry : output.entrySet()) { // Itrate
																			// through
																			// hashmap
				if (entry.getValue() == maxKey) {

					msg = String.valueOf(entry.getKey());

					break;
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return msg;
	}
	Map<String, Integer> wordMap = new HashMap<String, Integer>();

    public void incCount(String word) {
        Integer oldCount = wordMap.get(word);
        wordMap.put(word, oldCount == null ? 1 : oldCount + 1);
    }

    double getSimilarity(Similarity otherVector) {
        double innerProduct = 0;
        for(String w: this.wordMap.keySet()) {
            innerProduct += this.getCount(w) * otherVector.getCount(w);
        }
        return innerProduct / (this.getNorm() * otherVector.getNorm());
    }

    double getNorm() {
        double sum = 0;
        for (Integer count : wordMap.values()) {
            sum += count * count;
        }
        return Math.sqrt(sum);
    }

    int getCount(String word) {
        return wordMap.containsKey(word) ? wordMap.get(word) : 0;
    }

    public double Getscore(String W1, String W2) {
       // String doc1 = vector1;
        //String doc2 = vector2;

    	double getscore=0.0;
        Similarity v1 = new Similarity();
        for(String w:W1.split("[^a-zA-Z]+")) {
            v1.incCount(w);
        }

        Similarity v2 = new Similarity();
        for(String w:W2.split("[^a-zA-Z]+")) {
            v2.incCount(w);
        }
        double score=v1.getSimilarity(v2);
        if(Double.isNaN(score))
        {
        	getscore=0.0;
        }
        else
        {
        	getscore=score;
        }
        
        return getscore;
    }
public static void main(String args[])
{
        
           
}

}
