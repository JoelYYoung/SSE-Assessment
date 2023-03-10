; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_22a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@CWE127_Buffer_Underread__CWE839_connect_socket_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G1Global = dso_local global i32 0, align 4, !dbg !62
@CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G2Global = dso_local global i32 0, align 4, !dbg !66
@CWE127_Buffer_Underread__CWE839_connect_socket_22_goodG2BGlobal = dso_local global i32 0, align 4, !dbg !68
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_22_bad() #0 !dbg !76 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 -1, i32* %data, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !83, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %connectSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  br label %do.body, !dbg !113

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !114
  store i32 %call, i32* %connectSocket, align 4, !dbg !116
  %0 = load i32, i32* %connectSocket, align 4, !dbg !117
  %cmp = icmp eq i32 %0, -1, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !121

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !123
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !124
  store i16 2, i16* %sin_family, align 4, !dbg !125
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !126
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !127
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !128
  store i32 %call1, i32* %s_addr, align 4, !dbg !129
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !130
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !131
  store i16 %call2, i16* %sin_port, align 2, !dbg !132
  %2 = load i32, i32* %connectSocket, align 4, !dbg !133
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !135
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !136
  %cmp4 = icmp eq i32 %call3, -1, !dbg !137
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !138

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !139

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !141
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !142
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !143
  %conv = trunc i64 %call7 to i32, !dbg !143
  store i32 %conv, i32* %recvResult, align 4, !dbg !144
  %5 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp8 = icmp eq i32 %5, -1, !dbg !147
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !148

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !149
  %cmp10 = icmp eq i32 %6, 0, !dbg !150
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !151

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !152

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !154
  %idxprom = sext i32 %7 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !156
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !158
  store i32 %call15, i32* %data, align 4, !dbg !159
  br label %do.end, !dbg !160

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !161
  %cmp16 = icmp ne i32 %8, -1, !dbg !163
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !164

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !165
  %call19 = call i32 @close(i32 %9), !dbg !167
  br label %if.end20, !dbg !168

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 1, i32* @CWE127_Buffer_Underread__CWE839_connect_socket_22_badGlobal, align 4, !dbg !169
  %10 = load i32, i32* %data, align 4, !dbg !170
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_22_badSink(i32 %10), !dbg !171
  ret void, !dbg !172
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #2

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

declare dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_22_badSink(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_22_good() #0 !dbg !173 {
entry:
  call void @goodB2G1(), !dbg !174
  call void @goodB2G2(), !dbg !175
  call void @goodG2B(), !dbg !176
  ret void, !dbg !177
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !178 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !183, metadata !DIExpression()), !dbg !184
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !185, metadata !DIExpression()), !dbg !186
  %call = call i64 @time(i64* null) #7, !dbg !187
  %conv = trunc i64 %call to i32, !dbg !188
  call void @srand(i32 %conv) #7, !dbg !189
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !190
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_22_good(), !dbg !191
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !192
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !193
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_22_bad(), !dbg !194
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !195
  ret i32 0, !dbg !196
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !197 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 -1, i32* %data, align 4, !dbg !200
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !201, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !204, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !206, metadata !DIExpression()), !dbg !207
  store i32 -1, i32* %connectSocket, align 4, !dbg !207
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !208, metadata !DIExpression()), !dbg !209
  br label %do.body, !dbg !210

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !211
  store i32 %call, i32* %connectSocket, align 4, !dbg !213
  %0 = load i32, i32* %connectSocket, align 4, !dbg !214
  %cmp = icmp eq i32 %0, -1, !dbg !216
  br i1 %cmp, label %if.then, label %if.end, !dbg !217

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !218

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !220
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !220
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !221
  store i16 2, i16* %sin_family, align 4, !dbg !222
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !223
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !224
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !225
  store i32 %call1, i32* %s_addr, align 4, !dbg !226
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !227
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !228
  store i16 %call2, i16* %sin_port, align 2, !dbg !229
  %2 = load i32, i32* %connectSocket, align 4, !dbg !230
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !232
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !233
  %cmp4 = icmp eq i32 %call3, -1, !dbg !234
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !235

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !236

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !238
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !239
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !240
  %conv = trunc i64 %call7 to i32, !dbg !240
  store i32 %conv, i32* %recvResult, align 4, !dbg !241
  %5 = load i32, i32* %recvResult, align 4, !dbg !242
  %cmp8 = icmp eq i32 %5, -1, !dbg !244
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !245

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !246
  %cmp10 = icmp eq i32 %6, 0, !dbg !247
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !248

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !249

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !251
  %idxprom = sext i32 %7 to i64, !dbg !252
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !252
  store i8 0, i8* %arrayidx, align 1, !dbg !253
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !254
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !255
  store i32 %call15, i32* %data, align 4, !dbg !256
  br label %do.end, !dbg !257

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !258
  %cmp16 = icmp ne i32 %8, -1, !dbg !260
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !261

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !262
  %call19 = call i32 @close(i32 %9), !dbg !264
  br label %if.end20, !dbg !265

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 0, i32* @CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G1Global, align 4, !dbg !266
  %10 = load i32, i32* %data, align 4, !dbg !267
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G1Sink(i32 %10), !dbg !268
  ret void, !dbg !269
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G1Sink(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !270 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 -1, i32* %data, align 4, !dbg !273
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !274, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !277, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !279, metadata !DIExpression()), !dbg !280
  store i32 -1, i32* %connectSocket, align 4, !dbg !280
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !281, metadata !DIExpression()), !dbg !282
  br label %do.body, !dbg !283

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !284
  store i32 %call, i32* %connectSocket, align 4, !dbg !286
  %0 = load i32, i32* %connectSocket, align 4, !dbg !287
  %cmp = icmp eq i32 %0, -1, !dbg !289
  br i1 %cmp, label %if.then, label %if.end, !dbg !290

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !291

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !293
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !293
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !294
  store i16 2, i16* %sin_family, align 4, !dbg !295
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !296
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !297
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !298
  store i32 %call1, i32* %s_addr, align 4, !dbg !299
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !300
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !301
  store i16 %call2, i16* %sin_port, align 2, !dbg !302
  %2 = load i32, i32* %connectSocket, align 4, !dbg !303
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !305
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !306
  %cmp4 = icmp eq i32 %call3, -1, !dbg !307
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !308

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !309

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !311
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !312
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !313
  %conv = trunc i64 %call7 to i32, !dbg !313
  store i32 %conv, i32* %recvResult, align 4, !dbg !314
  %5 = load i32, i32* %recvResult, align 4, !dbg !315
  %cmp8 = icmp eq i32 %5, -1, !dbg !317
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !318

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !319
  %cmp10 = icmp eq i32 %6, 0, !dbg !320
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !321

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !322

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !324
  %idxprom = sext i32 %7 to i64, !dbg !325
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !325
  store i8 0, i8* %arrayidx, align 1, !dbg !326
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !327
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !328
  store i32 %call15, i32* %data, align 4, !dbg !329
  br label %do.end, !dbg !330

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !331
  %cmp16 = icmp ne i32 %8, -1, !dbg !333
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !334

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !335
  %call19 = call i32 @close(i32 %9), !dbg !337
  br label %if.end20, !dbg !338

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 1, i32* @CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G2Global, align 4, !dbg !339
  %10 = load i32, i32* %data, align 4, !dbg !340
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G2Sink(i32 %10), !dbg !341
  ret void, !dbg !342
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G2Sink(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !343 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !344, metadata !DIExpression()), !dbg !345
  store i32 -1, i32* %data, align 4, !dbg !346
  store i32 7, i32* %data, align 4, !dbg !347
  store i32 1, i32* @CWE127_Buffer_Underread__CWE839_connect_socket_22_goodG2BGlobal, align 4, !dbg !348
  %0 = load i32, i32* %data, align 4, !dbg !349
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_22_goodG2BSink(i32 %0), !dbg !350
  ret void, !dbg !351
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_22_goodG2BSink(i32) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!70, !71, !72, !73, !74}
!llvm.ident = !{!75}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_connect_socket_22_badGlobal", scope: !2, file: !64, line: 45, type: !65, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !61, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{!5, !18}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !6, line: 24, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17}
!9 = !DIEnumerator(name: "SOCK_STREAM", value: 1)
!10 = !DIEnumerator(name: "SOCK_DGRAM", value: 2)
!11 = !DIEnumerator(name: "SOCK_RAW", value: 3)
!12 = !DIEnumerator(name: "SOCK_RDM", value: 4)
!13 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5)
!14 = !DIEnumerator(name: "SOCK_DCCP", value: 6)
!15 = !DIEnumerator(name: "SOCK_PACKET", value: 10)
!16 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288)
!17 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048)
!18 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !19, line: 40, baseType: !7, size: 32, elements: !20)
!19 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!20 = !{!21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46}
!21 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!22 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!23 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!24 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!25 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!26 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!27 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!28 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!29 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!30 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!31 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!32 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!33 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!34 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!35 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!36 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!37 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!38 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!39 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!40 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!41 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!42 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!43 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!44 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!45 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!46 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!47 = !{!48, !7}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !50, line: 178, size: 128, elements: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!51 = !{!52, !56}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !49, file: !50, line: 180, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !54, line: 28, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !49, file: !50, line: 181, baseType: !57, size: 112, offset: 16)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 112, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 14)
!61 = !{!0, !62, !66, !68}
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G1Global", scope: !2, file: !64, line: 119, type: !65, isLocal: false, isDefinition: true)
!64 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_22a.c", directory: "/home/joelyang/SSE-Assessment")
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_connect_socket_22_goodB2G2Global", scope: !2, file: !64, line: 120, type: !65, isLocal: false, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_connect_socket_22_goodG2BGlobal", scope: !2, file: !64, line: 121, type: !65, isLocal: false, isDefinition: true)
!70 = !{i32 7, !"Dwarf Version", i32 4}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 4}
!73 = !{i32 7, !"uwtable", i32 1}
!74 = !{i32 7, !"frame-pointer", i32 2}
!75 = !{!"clang version 13.0.0"}
!76 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_22_bad", scope: !64, file: !64, line: 49, type: !77, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!77 = !DISubroutineType(types: !78)
!78 = !{null}
!79 = !{}
!80 = !DILocalVariable(name: "data", scope: !76, file: !64, line: 51, type: !65)
!81 = !DILocation(line: 51, column: 9, scope: !76)
!82 = !DILocation(line: 53, column: 10, scope: !76)
!83 = !DILocalVariable(name: "recvResult", scope: !84, file: !64, line: 59, type: !65)
!84 = distinct !DILexicalBlock(scope: !76, file: !64, line: 54, column: 5)
!85 = !DILocation(line: 59, column: 13, scope: !84)
!86 = !DILocalVariable(name: "service", scope: !84, file: !64, line: 60, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !88)
!88 = !{!89, !90, !96, !103}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !19, line: 240, baseType: !53, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !19, line: 241, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !93, line: 25, baseType: !94)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !95, line: 40, baseType: !55)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !19, line: 242, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !19, line: 33, baseType: !100, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !93, line: 26, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !95, line: 42, baseType: !7)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !19, line: 245, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 60, column: 28, scope: !84)
!109 = !DILocalVariable(name: "connectSocket", scope: !84, file: !64, line: 61, type: !65)
!110 = !DILocation(line: 61, column: 16, scope: !84)
!111 = !DILocalVariable(name: "inputBuffer", scope: !84, file: !64, line: 62, type: !57)
!112 = !DILocation(line: 62, column: 14, scope: !84)
!113 = !DILocation(line: 63, column: 9, scope: !84)
!114 = !DILocation(line: 73, column: 29, scope: !115)
!115 = distinct !DILexicalBlock(scope: !84, file: !64, line: 64, column: 9)
!116 = !DILocation(line: 73, column: 27, scope: !115)
!117 = !DILocation(line: 74, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !64, line: 74, column: 17)
!119 = !DILocation(line: 74, column: 31, scope: !118)
!120 = !DILocation(line: 74, column: 17, scope: !115)
!121 = !DILocation(line: 76, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !64, line: 75, column: 13)
!123 = !DILocation(line: 78, column: 13, scope: !115)
!124 = !DILocation(line: 79, column: 21, scope: !115)
!125 = !DILocation(line: 79, column: 32, scope: !115)
!126 = !DILocation(line: 80, column: 39, scope: !115)
!127 = !DILocation(line: 80, column: 21, scope: !115)
!128 = !DILocation(line: 80, column: 30, scope: !115)
!129 = !DILocation(line: 80, column: 37, scope: !115)
!130 = !DILocation(line: 81, column: 32, scope: !115)
!131 = !DILocation(line: 81, column: 21, scope: !115)
!132 = !DILocation(line: 81, column: 30, scope: !115)
!133 = !DILocation(line: 82, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !115, file: !64, line: 82, column: 17)
!135 = !DILocation(line: 82, column: 40, scope: !134)
!136 = !DILocation(line: 82, column: 17, scope: !134)
!137 = !DILocation(line: 82, column: 85, scope: !134)
!138 = !DILocation(line: 82, column: 17, scope: !115)
!139 = !DILocation(line: 84, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !64, line: 83, column: 13)
!141 = !DILocation(line: 88, column: 31, scope: !115)
!142 = !DILocation(line: 88, column: 46, scope: !115)
!143 = !DILocation(line: 88, column: 26, scope: !115)
!144 = !DILocation(line: 88, column: 24, scope: !115)
!145 = !DILocation(line: 89, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !115, file: !64, line: 89, column: 17)
!147 = !DILocation(line: 89, column: 28, scope: !146)
!148 = !DILocation(line: 89, column: 44, scope: !146)
!149 = !DILocation(line: 89, column: 47, scope: !146)
!150 = !DILocation(line: 89, column: 58, scope: !146)
!151 = !DILocation(line: 89, column: 17, scope: !115)
!152 = !DILocation(line: 91, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !64, line: 90, column: 13)
!154 = !DILocation(line: 94, column: 25, scope: !115)
!155 = !DILocation(line: 94, column: 13, scope: !115)
!156 = !DILocation(line: 94, column: 37, scope: !115)
!157 = !DILocation(line: 96, column: 25, scope: !115)
!158 = !DILocation(line: 96, column: 20, scope: !115)
!159 = !DILocation(line: 96, column: 18, scope: !115)
!160 = !DILocation(line: 97, column: 9, scope: !115)
!161 = !DILocation(line: 99, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !84, file: !64, line: 99, column: 13)
!163 = !DILocation(line: 99, column: 27, scope: !162)
!164 = !DILocation(line: 99, column: 13, scope: !84)
!165 = !DILocation(line: 101, column: 26, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !64, line: 100, column: 9)
!167 = !DILocation(line: 101, column: 13, scope: !166)
!168 = !DILocation(line: 102, column: 9, scope: !166)
!169 = !DILocation(line: 110, column: 65, scope: !76)
!170 = !DILocation(line: 111, column: 63, scope: !76)
!171 = !DILocation(line: 111, column: 5, scope: !76)
!172 = !DILocation(line: 112, column: 1, scope: !76)
!173 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_22_good", scope: !64, file: !64, line: 274, type: !77, scopeLine: 275, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!174 = !DILocation(line: 276, column: 5, scope: !173)
!175 = !DILocation(line: 277, column: 5, scope: !173)
!176 = !DILocation(line: 278, column: 5, scope: !173)
!177 = !DILocation(line: 279, column: 1, scope: !173)
!178 = distinct !DISubprogram(name: "main", scope: !64, file: !64, line: 290, type: !179, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!179 = !DISubroutineType(types: !180)
!180 = !{!65, !65, !181}
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !182, size: 64)
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!183 = !DILocalVariable(name: "argc", arg: 1, scope: !178, file: !64, line: 290, type: !65)
!184 = !DILocation(line: 290, column: 14, scope: !178)
!185 = !DILocalVariable(name: "argv", arg: 2, scope: !178, file: !64, line: 290, type: !181)
!186 = !DILocation(line: 290, column: 27, scope: !178)
!187 = !DILocation(line: 293, column: 22, scope: !178)
!188 = !DILocation(line: 293, column: 12, scope: !178)
!189 = !DILocation(line: 293, column: 5, scope: !178)
!190 = !DILocation(line: 295, column: 5, scope: !178)
!191 = !DILocation(line: 296, column: 5, scope: !178)
!192 = !DILocation(line: 297, column: 5, scope: !178)
!193 = !DILocation(line: 300, column: 5, scope: !178)
!194 = !DILocation(line: 301, column: 5, scope: !178)
!195 = !DILocation(line: 302, column: 5, scope: !178)
!196 = !DILocation(line: 304, column: 5, scope: !178)
!197 = distinct !DISubprogram(name: "goodB2G1", scope: !64, file: !64, line: 126, type: !77, scopeLine: 127, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!198 = !DILocalVariable(name: "data", scope: !197, file: !64, line: 128, type: !65)
!199 = !DILocation(line: 128, column: 9, scope: !197)
!200 = !DILocation(line: 130, column: 10, scope: !197)
!201 = !DILocalVariable(name: "recvResult", scope: !202, file: !64, line: 136, type: !65)
!202 = distinct !DILexicalBlock(scope: !197, file: !64, line: 131, column: 5)
!203 = !DILocation(line: 136, column: 13, scope: !202)
!204 = !DILocalVariable(name: "service", scope: !202, file: !64, line: 137, type: !87)
!205 = !DILocation(line: 137, column: 28, scope: !202)
!206 = !DILocalVariable(name: "connectSocket", scope: !202, file: !64, line: 138, type: !65)
!207 = !DILocation(line: 138, column: 16, scope: !202)
!208 = !DILocalVariable(name: "inputBuffer", scope: !202, file: !64, line: 139, type: !57)
!209 = !DILocation(line: 139, column: 14, scope: !202)
!210 = !DILocation(line: 140, column: 9, scope: !202)
!211 = !DILocation(line: 150, column: 29, scope: !212)
!212 = distinct !DILexicalBlock(scope: !202, file: !64, line: 141, column: 9)
!213 = !DILocation(line: 150, column: 27, scope: !212)
!214 = !DILocation(line: 151, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !64, line: 151, column: 17)
!216 = !DILocation(line: 151, column: 31, scope: !215)
!217 = !DILocation(line: 151, column: 17, scope: !212)
!218 = !DILocation(line: 153, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !64, line: 152, column: 13)
!220 = !DILocation(line: 155, column: 13, scope: !212)
!221 = !DILocation(line: 156, column: 21, scope: !212)
!222 = !DILocation(line: 156, column: 32, scope: !212)
!223 = !DILocation(line: 157, column: 39, scope: !212)
!224 = !DILocation(line: 157, column: 21, scope: !212)
!225 = !DILocation(line: 157, column: 30, scope: !212)
!226 = !DILocation(line: 157, column: 37, scope: !212)
!227 = !DILocation(line: 158, column: 32, scope: !212)
!228 = !DILocation(line: 158, column: 21, scope: !212)
!229 = !DILocation(line: 158, column: 30, scope: !212)
!230 = !DILocation(line: 159, column: 25, scope: !231)
!231 = distinct !DILexicalBlock(scope: !212, file: !64, line: 159, column: 17)
!232 = !DILocation(line: 159, column: 40, scope: !231)
!233 = !DILocation(line: 159, column: 17, scope: !231)
!234 = !DILocation(line: 159, column: 85, scope: !231)
!235 = !DILocation(line: 159, column: 17, scope: !212)
!236 = !DILocation(line: 161, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !231, file: !64, line: 160, column: 13)
!238 = !DILocation(line: 165, column: 31, scope: !212)
!239 = !DILocation(line: 165, column: 46, scope: !212)
!240 = !DILocation(line: 165, column: 26, scope: !212)
!241 = !DILocation(line: 165, column: 24, scope: !212)
!242 = !DILocation(line: 166, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !212, file: !64, line: 166, column: 17)
!244 = !DILocation(line: 166, column: 28, scope: !243)
!245 = !DILocation(line: 166, column: 44, scope: !243)
!246 = !DILocation(line: 166, column: 47, scope: !243)
!247 = !DILocation(line: 166, column: 58, scope: !243)
!248 = !DILocation(line: 166, column: 17, scope: !212)
!249 = !DILocation(line: 168, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !243, file: !64, line: 167, column: 13)
!251 = !DILocation(line: 171, column: 25, scope: !212)
!252 = !DILocation(line: 171, column: 13, scope: !212)
!253 = !DILocation(line: 171, column: 37, scope: !212)
!254 = !DILocation(line: 173, column: 25, scope: !212)
!255 = !DILocation(line: 173, column: 20, scope: !212)
!256 = !DILocation(line: 173, column: 18, scope: !212)
!257 = !DILocation(line: 174, column: 9, scope: !212)
!258 = !DILocation(line: 176, column: 13, scope: !259)
!259 = distinct !DILexicalBlock(scope: !202, file: !64, line: 176, column: 13)
!260 = !DILocation(line: 176, column: 27, scope: !259)
!261 = !DILocation(line: 176, column: 13, scope: !202)
!262 = !DILocation(line: 178, column: 26, scope: !263)
!263 = distinct !DILexicalBlock(scope: !259, file: !64, line: 177, column: 9)
!264 = !DILocation(line: 178, column: 13, scope: !263)
!265 = !DILocation(line: 179, column: 9, scope: !263)
!266 = !DILocation(line: 187, column: 70, scope: !197)
!267 = !DILocation(line: 188, column: 68, scope: !197)
!268 = !DILocation(line: 188, column: 5, scope: !197)
!269 = !DILocation(line: 189, column: 1, scope: !197)
!270 = distinct !DISubprogram(name: "goodB2G2", scope: !64, file: !64, line: 194, type: !77, scopeLine: 195, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!271 = !DILocalVariable(name: "data", scope: !270, file: !64, line: 196, type: !65)
!272 = !DILocation(line: 196, column: 9, scope: !270)
!273 = !DILocation(line: 198, column: 10, scope: !270)
!274 = !DILocalVariable(name: "recvResult", scope: !275, file: !64, line: 204, type: !65)
!275 = distinct !DILexicalBlock(scope: !270, file: !64, line: 199, column: 5)
!276 = !DILocation(line: 204, column: 13, scope: !275)
!277 = !DILocalVariable(name: "service", scope: !275, file: !64, line: 205, type: !87)
!278 = !DILocation(line: 205, column: 28, scope: !275)
!279 = !DILocalVariable(name: "connectSocket", scope: !275, file: !64, line: 206, type: !65)
!280 = !DILocation(line: 206, column: 16, scope: !275)
!281 = !DILocalVariable(name: "inputBuffer", scope: !275, file: !64, line: 207, type: !57)
!282 = !DILocation(line: 207, column: 14, scope: !275)
!283 = !DILocation(line: 208, column: 9, scope: !275)
!284 = !DILocation(line: 218, column: 29, scope: !285)
!285 = distinct !DILexicalBlock(scope: !275, file: !64, line: 209, column: 9)
!286 = !DILocation(line: 218, column: 27, scope: !285)
!287 = !DILocation(line: 219, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !64, line: 219, column: 17)
!289 = !DILocation(line: 219, column: 31, scope: !288)
!290 = !DILocation(line: 219, column: 17, scope: !285)
!291 = !DILocation(line: 221, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !64, line: 220, column: 13)
!293 = !DILocation(line: 223, column: 13, scope: !285)
!294 = !DILocation(line: 224, column: 21, scope: !285)
!295 = !DILocation(line: 224, column: 32, scope: !285)
!296 = !DILocation(line: 225, column: 39, scope: !285)
!297 = !DILocation(line: 225, column: 21, scope: !285)
!298 = !DILocation(line: 225, column: 30, scope: !285)
!299 = !DILocation(line: 225, column: 37, scope: !285)
!300 = !DILocation(line: 226, column: 32, scope: !285)
!301 = !DILocation(line: 226, column: 21, scope: !285)
!302 = !DILocation(line: 226, column: 30, scope: !285)
!303 = !DILocation(line: 227, column: 25, scope: !304)
!304 = distinct !DILexicalBlock(scope: !285, file: !64, line: 227, column: 17)
!305 = !DILocation(line: 227, column: 40, scope: !304)
!306 = !DILocation(line: 227, column: 17, scope: !304)
!307 = !DILocation(line: 227, column: 85, scope: !304)
!308 = !DILocation(line: 227, column: 17, scope: !285)
!309 = !DILocation(line: 229, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !304, file: !64, line: 228, column: 13)
!311 = !DILocation(line: 233, column: 31, scope: !285)
!312 = !DILocation(line: 233, column: 46, scope: !285)
!313 = !DILocation(line: 233, column: 26, scope: !285)
!314 = !DILocation(line: 233, column: 24, scope: !285)
!315 = !DILocation(line: 234, column: 17, scope: !316)
!316 = distinct !DILexicalBlock(scope: !285, file: !64, line: 234, column: 17)
!317 = !DILocation(line: 234, column: 28, scope: !316)
!318 = !DILocation(line: 234, column: 44, scope: !316)
!319 = !DILocation(line: 234, column: 47, scope: !316)
!320 = !DILocation(line: 234, column: 58, scope: !316)
!321 = !DILocation(line: 234, column: 17, scope: !285)
!322 = !DILocation(line: 236, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !316, file: !64, line: 235, column: 13)
!324 = !DILocation(line: 239, column: 25, scope: !285)
!325 = !DILocation(line: 239, column: 13, scope: !285)
!326 = !DILocation(line: 239, column: 37, scope: !285)
!327 = !DILocation(line: 241, column: 25, scope: !285)
!328 = !DILocation(line: 241, column: 20, scope: !285)
!329 = !DILocation(line: 241, column: 18, scope: !285)
!330 = !DILocation(line: 242, column: 9, scope: !285)
!331 = !DILocation(line: 244, column: 13, scope: !332)
!332 = distinct !DILexicalBlock(scope: !275, file: !64, line: 244, column: 13)
!333 = !DILocation(line: 244, column: 27, scope: !332)
!334 = !DILocation(line: 244, column: 13, scope: !275)
!335 = !DILocation(line: 246, column: 26, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !64, line: 245, column: 9)
!337 = !DILocation(line: 246, column: 13, scope: !336)
!338 = !DILocation(line: 247, column: 9, scope: !336)
!339 = !DILocation(line: 255, column: 70, scope: !270)
!340 = !DILocation(line: 256, column: 68, scope: !270)
!341 = !DILocation(line: 256, column: 5, scope: !270)
!342 = !DILocation(line: 257, column: 1, scope: !270)
!343 = distinct !DISubprogram(name: "goodG2B", scope: !64, file: !64, line: 262, type: !77, scopeLine: 263, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!344 = !DILocalVariable(name: "data", scope: !343, file: !64, line: 264, type: !65)
!345 = !DILocation(line: 264, column: 9, scope: !343)
!346 = !DILocation(line: 266, column: 10, scope: !343)
!347 = !DILocation(line: 269, column: 10, scope: !343)
!348 = !DILocation(line: 270, column: 69, scope: !343)
!349 = !DILocation(line: 271, column: 67, scope: !343)
!350 = !DILocation(line: 271, column: 5, scope: !343)
!351 = !DILocation(line: 272, column: 1, scope: !343)
