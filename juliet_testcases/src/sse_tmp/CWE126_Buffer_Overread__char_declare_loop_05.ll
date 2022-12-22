; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !38
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx2, align 1, !dbg !40
  %0 = load i32, i32* @staticTrue, align 4, !dbg !41
  %tobool = icmp ne i32 %0, 0, !dbg !41
  br i1 %tobool, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !44
  store i8* %arraydecay3, i8** %data, align 8, !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !56, metadata !DIExpression()), !dbg !57
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx5, align 1, !dbg !60
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !62
  store i64 %call, i64* %destLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !67
  %2 = load i64, i64* %destLen, align 8, !dbg !69
  %cmp = icmp ult i64 %1, %2, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !72
  %4 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !72
  %5 = load i8, i8* %arrayidx7, align 1, !dbg !72
  %6 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !76
  store i8 %5, i8* %arrayidx8, align 1, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %7, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx9, align 1, !dbg !85
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  call void @printLine(i8* %arraydecay10), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_05_good() #0 !dbg !89 {
entry:
  call void @goodG2B1(), !dbg !90
  call void @goodG2B2(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__char_declare_loop_05_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__char_declare_loop_05_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !118
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !121
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx2, align 1, !dbg !123
  %0 = load i32, i32* @staticFalse, align 4, !dbg !124
  %tobool = icmp ne i32 %0, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.else, !dbg !126

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !127
  br label %if.end, !dbg !129

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !130
  store i8* %arraydecay3, i8** %data, align 8, !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx5, align 1, !dbg !142
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !144
  store i64 %call, i64* %destLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !149
  %2 = load i64, i64* %destLen, align 8, !dbg !151
  %cmp = icmp ult i64 %1, %2, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !154
  %4 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !154
  %5 = load i8, i8* %arrayidx7, align 1, !dbg !154
  %6 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !158
  store i8 %5, i8* %arrayidx8, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %7, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx9, align 1, !dbg !166
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* %arraydecay10), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !170 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !175, metadata !DIExpression()), !dbg !176
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !177
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !178
  store i8 0, i8* %arrayidx, align 1, !dbg !179
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !180
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !181
  store i8 0, i8* %arrayidx2, align 1, !dbg !182
  %0 = load i32, i32* @staticTrue, align 4, !dbg !183
  %tobool = icmp ne i32 %0, 0, !dbg !183
  br i1 %tobool, label %if.then, label %if.end, !dbg !185

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !186
  store i8* %arraydecay3, i8** %data, align 8, !dbg !188
  br label %if.end, !dbg !189

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !190, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !193, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !195, metadata !DIExpression()), !dbg !196
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !197
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !197
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !198
  store i8 0, i8* %arrayidx5, align 1, !dbg !199
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !200
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !201
  store i64 %call, i64* %destLen, align 8, !dbg !202
  store i64 0, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !205

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !206
  %2 = load i64, i64* %destLen, align 8, !dbg !208
  %cmp = icmp ult i64 %1, %2, !dbg !209
  br i1 %cmp, label %for.body, label %for.end, !dbg !210

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !211
  %4 = load i64, i64* %i, align 8, !dbg !213
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !211
  %5 = load i8, i8* %arrayidx7, align 1, !dbg !211
  %6 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !215
  store i8 %5, i8* %arrayidx8, align 1, !dbg !216
  br label %for.inc, !dbg !217

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !218
  %inc = add i64 %7, 1, !dbg !218
  store i64 %inc, i64* %i, align 8, !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !222
  store i8 0, i8* %arrayidx9, align 1, !dbg !223
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !224
  call void @printLine(i8* %arraydecay10), !dbg !225
  ret void, !dbg !226
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 34, column: 10, scope: !18)
!35 = !DILocation(line: 35, column: 5, scope: !18)
!36 = !DILocation(line: 36, column: 5, scope: !18)
!37 = !DILocation(line: 36, column: 25, scope: !18)
!38 = !DILocation(line: 37, column: 5, scope: !18)
!39 = !DILocation(line: 38, column: 5, scope: !18)
!40 = !DILocation(line: 38, column: 27, scope: !18)
!41 = !DILocation(line: 39, column: 8, scope: !42)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 8)
!43 = !DILocation(line: 39, column: 8, scope: !18)
!44 = !DILocation(line: 42, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !10, line: 40, column: 5)
!46 = !DILocation(line: 42, column: 14, scope: !45)
!47 = !DILocation(line: 43, column: 5, scope: !45)
!48 = !DILocalVariable(name: "i", scope: !49, file: !10, line: 45, type: !50)
!49 = distinct !DILexicalBlock(scope: !18, file: !10, line: 44, column: 5)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 45, column: 16, scope: !49)
!54 = !DILocalVariable(name: "destLen", scope: !49, file: !10, line: 45, type: !50)
!55 = !DILocation(line: 45, column: 19, scope: !49)
!56 = !DILocalVariable(name: "dest", scope: !49, file: !10, line: 46, type: !31)
!57 = !DILocation(line: 46, column: 14, scope: !49)
!58 = !DILocation(line: 47, column: 9, scope: !49)
!59 = !DILocation(line: 48, column: 9, scope: !49)
!60 = !DILocation(line: 48, column: 21, scope: !49)
!61 = !DILocation(line: 49, column: 26, scope: !49)
!62 = !DILocation(line: 49, column: 19, scope: !49)
!63 = !DILocation(line: 49, column: 17, scope: !49)
!64 = !DILocation(line: 52, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !49, file: !10, line: 52, column: 9)
!66 = !DILocation(line: 52, column: 14, scope: !65)
!67 = !DILocation(line: 52, column: 21, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !10, line: 52, column: 9)
!69 = !DILocation(line: 52, column: 25, scope: !68)
!70 = !DILocation(line: 52, column: 23, scope: !68)
!71 = !DILocation(line: 52, column: 9, scope: !65)
!72 = !DILocation(line: 54, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !10, line: 53, column: 9)
!74 = !DILocation(line: 54, column: 28, scope: !73)
!75 = !DILocation(line: 54, column: 18, scope: !73)
!76 = !DILocation(line: 54, column: 13, scope: !73)
!77 = !DILocation(line: 54, column: 21, scope: !73)
!78 = !DILocation(line: 55, column: 9, scope: !73)
!79 = !DILocation(line: 52, column: 35, scope: !68)
!80 = !DILocation(line: 52, column: 9, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 55, column: 9, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 56, column: 9, scope: !49)
!85 = !DILocation(line: 56, column: 21, scope: !49)
!86 = !DILocation(line: 57, column: 19, scope: !49)
!87 = !DILocation(line: 57, column: 9, scope: !49)
!88 = !DILocation(line: 59, column: 1, scope: !18)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_05_good", scope: !10, file: !10, line: 134, type: !19, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocation(line: 136, column: 5, scope: !89)
!91 = !DILocation(line: 137, column: 5, scope: !89)
!92 = !DILocation(line: 138, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 150, type: !94, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DISubroutineType(types: !95)
!95 = !{!11, !11, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !10, line: 150, type: !11)
!98 = !DILocation(line: 150, column: 14, scope: !93)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !10, line: 150, type: !96)
!100 = !DILocation(line: 150, column: 27, scope: !93)
!101 = !DILocation(line: 153, column: 22, scope: !93)
!102 = !DILocation(line: 153, column: 12, scope: !93)
!103 = !DILocation(line: 153, column: 5, scope: !93)
!104 = !DILocation(line: 155, column: 5, scope: !93)
!105 = !DILocation(line: 156, column: 5, scope: !93)
!106 = !DILocation(line: 157, column: 5, scope: !93)
!107 = !DILocation(line: 160, column: 5, scope: !93)
!108 = !DILocation(line: 161, column: 5, scope: !93)
!109 = !DILocation(line: 162, column: 5, scope: !93)
!110 = !DILocation(line: 164, column: 5, scope: !93)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 66, type: !19, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !10, line: 68, type: !22)
!113 = !DILocation(line: 68, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !10, line: 69, type: !26)
!115 = !DILocation(line: 69, column: 10, scope: !111)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !10, line: 70, type: !31)
!117 = !DILocation(line: 70, column: 10, scope: !111)
!118 = !DILocation(line: 71, column: 5, scope: !111)
!119 = !DILocation(line: 72, column: 5, scope: !111)
!120 = !DILocation(line: 72, column: 25, scope: !111)
!121 = !DILocation(line: 73, column: 5, scope: !111)
!122 = !DILocation(line: 74, column: 5, scope: !111)
!123 = !DILocation(line: 74, column: 27, scope: !111)
!124 = !DILocation(line: 75, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !111, file: !10, line: 75, column: 8)
!126 = !DILocation(line: 75, column: 8, scope: !111)
!127 = !DILocation(line: 78, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !10, line: 76, column: 5)
!129 = !DILocation(line: 79, column: 5, scope: !128)
!130 = !DILocation(line: 83, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !10, line: 81, column: 5)
!132 = !DILocation(line: 83, column: 14, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !134, file: !10, line: 86, type: !50)
!134 = distinct !DILexicalBlock(scope: !111, file: !10, line: 85, column: 5)
!135 = !DILocation(line: 86, column: 16, scope: !134)
!136 = !DILocalVariable(name: "destLen", scope: !134, file: !10, line: 86, type: !50)
!137 = !DILocation(line: 86, column: 19, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !134, file: !10, line: 87, type: !31)
!139 = !DILocation(line: 87, column: 14, scope: !134)
!140 = !DILocation(line: 88, column: 9, scope: !134)
!141 = !DILocation(line: 89, column: 9, scope: !134)
!142 = !DILocation(line: 89, column: 21, scope: !134)
!143 = !DILocation(line: 90, column: 26, scope: !134)
!144 = !DILocation(line: 90, column: 19, scope: !134)
!145 = !DILocation(line: 90, column: 17, scope: !134)
!146 = !DILocation(line: 93, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !134, file: !10, line: 93, column: 9)
!148 = !DILocation(line: 93, column: 14, scope: !147)
!149 = !DILocation(line: 93, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !10, line: 93, column: 9)
!151 = !DILocation(line: 93, column: 25, scope: !150)
!152 = !DILocation(line: 93, column: 23, scope: !150)
!153 = !DILocation(line: 93, column: 9, scope: !147)
!154 = !DILocation(line: 95, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !10, line: 94, column: 9)
!156 = !DILocation(line: 95, column: 28, scope: !155)
!157 = !DILocation(line: 95, column: 18, scope: !155)
!158 = !DILocation(line: 95, column: 13, scope: !155)
!159 = !DILocation(line: 95, column: 21, scope: !155)
!160 = !DILocation(line: 96, column: 9, scope: !155)
!161 = !DILocation(line: 93, column: 35, scope: !150)
!162 = !DILocation(line: 93, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !83}
!164 = !DILocation(line: 96, column: 9, scope: !147)
!165 = !DILocation(line: 97, column: 9, scope: !134)
!166 = !DILocation(line: 97, column: 21, scope: !134)
!167 = !DILocation(line: 98, column: 19, scope: !134)
!168 = !DILocation(line: 98, column: 9, scope: !134)
!169 = !DILocation(line: 100, column: 1, scope: !111)
!170 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 103, type: !19, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocalVariable(name: "data", scope: !170, file: !10, line: 105, type: !22)
!172 = !DILocation(line: 105, column: 12, scope: !170)
!173 = !DILocalVariable(name: "dataBadBuffer", scope: !170, file: !10, line: 106, type: !26)
!174 = !DILocation(line: 106, column: 10, scope: !170)
!175 = !DILocalVariable(name: "dataGoodBuffer", scope: !170, file: !10, line: 107, type: !31)
!176 = !DILocation(line: 107, column: 10, scope: !170)
!177 = !DILocation(line: 108, column: 5, scope: !170)
!178 = !DILocation(line: 109, column: 5, scope: !170)
!179 = !DILocation(line: 109, column: 25, scope: !170)
!180 = !DILocation(line: 110, column: 5, scope: !170)
!181 = !DILocation(line: 111, column: 5, scope: !170)
!182 = !DILocation(line: 111, column: 27, scope: !170)
!183 = !DILocation(line: 112, column: 8, scope: !184)
!184 = distinct !DILexicalBlock(scope: !170, file: !10, line: 112, column: 8)
!185 = !DILocation(line: 112, column: 8, scope: !170)
!186 = !DILocation(line: 115, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !10, line: 113, column: 5)
!188 = !DILocation(line: 115, column: 14, scope: !187)
!189 = !DILocation(line: 116, column: 5, scope: !187)
!190 = !DILocalVariable(name: "i", scope: !191, file: !10, line: 118, type: !50)
!191 = distinct !DILexicalBlock(scope: !170, file: !10, line: 117, column: 5)
!192 = !DILocation(line: 118, column: 16, scope: !191)
!193 = !DILocalVariable(name: "destLen", scope: !191, file: !10, line: 118, type: !50)
!194 = !DILocation(line: 118, column: 19, scope: !191)
!195 = !DILocalVariable(name: "dest", scope: !191, file: !10, line: 119, type: !31)
!196 = !DILocation(line: 119, column: 14, scope: !191)
!197 = !DILocation(line: 120, column: 9, scope: !191)
!198 = !DILocation(line: 121, column: 9, scope: !191)
!199 = !DILocation(line: 121, column: 21, scope: !191)
!200 = !DILocation(line: 122, column: 26, scope: !191)
!201 = !DILocation(line: 122, column: 19, scope: !191)
!202 = !DILocation(line: 122, column: 17, scope: !191)
!203 = !DILocation(line: 125, column: 16, scope: !204)
!204 = distinct !DILexicalBlock(scope: !191, file: !10, line: 125, column: 9)
!205 = !DILocation(line: 125, column: 14, scope: !204)
!206 = !DILocation(line: 125, column: 21, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !10, line: 125, column: 9)
!208 = !DILocation(line: 125, column: 25, scope: !207)
!209 = !DILocation(line: 125, column: 23, scope: !207)
!210 = !DILocation(line: 125, column: 9, scope: !204)
!211 = !DILocation(line: 127, column: 23, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !10, line: 126, column: 9)
!213 = !DILocation(line: 127, column: 28, scope: !212)
!214 = !DILocation(line: 127, column: 18, scope: !212)
!215 = !DILocation(line: 127, column: 13, scope: !212)
!216 = !DILocation(line: 127, column: 21, scope: !212)
!217 = !DILocation(line: 128, column: 9, scope: !212)
!218 = !DILocation(line: 125, column: 35, scope: !207)
!219 = !DILocation(line: 125, column: 9, scope: !207)
!220 = distinct !{!220, !210, !221, !83}
!221 = !DILocation(line: 128, column: 9, scope: !204)
!222 = !DILocation(line: 129, column: 9, scope: !191)
!223 = !DILocation(line: 129, column: 21, scope: !191)
!224 = !DILocation(line: 130, column: 19, scope: !191)
!225 = !DILocation(line: 130, column: 9, scope: !191)
!226 = !DILocation(line: 132, column: 1, scope: !170)
