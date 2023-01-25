; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_06.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_06_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay3, i8** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx5, align 1, !dbg !51
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !53
  store i64 %call, i64* %destLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !58
  %1 = load i64, i64* %destLen, align 8, !dbg !60
  %cmp = icmp ult i64 %0, %1, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !63
  %3 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !63
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !63
  %5 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !67
  store i8 %4, i8* %arrayidx8, align 1, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %6, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !75
  store i8 0, i8* %arrayidx9, align 1, !dbg !76
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !77
  call void @printLine(i8* %arraydecay10), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_06_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE126_Buffer_Overread__char_declare_loop_06_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__char_declare_loop_06_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !110
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !113
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx2, align 1, !dbg !115
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store i8* %arraydecay3, i8** %data, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx5, align 1, !dbg !129
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !131
  store i64 %call, i64* %destLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !136
  %1 = load i64, i64* %destLen, align 8, !dbg !138
  %cmp = icmp ult i64 %0, %1, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !141
  %3 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !141
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !141
  %5 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !145
  store i8 %4, i8* %arrayidx8, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %6, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !152
  store i8 0, i8* %arrayidx9, align 1, !dbg !153
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !154
  call void @printLine(i8* %arraydecay10), !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !164
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !167
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !168
  store i8 0, i8* %arrayidx2, align 1, !dbg !169
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !170
  store i8* %arraydecay3, i8** %data, align 8, !dbg !173
  call void @llvm.dbg.declare(metadata i64* %i, metadata !174, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !179, metadata !DIExpression()), !dbg !180
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !181
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !182
  store i8 0, i8* %arrayidx5, align 1, !dbg !183
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !184
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !185
  store i64 %call, i64* %destLen, align 8, !dbg !186
  store i64 0, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !190
  %1 = load i64, i64* %destLen, align 8, !dbg !192
  %cmp = icmp ult i64 %0, %1, !dbg !193
  br i1 %cmp, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !195
  %3 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !195
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !195
  %5 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !199
  store i8 %4, i8* %arrayidx8, align 1, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %6, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !206
  store i8 0, i8* %arrayidx9, align 1, !dbg !207
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !208
  call void @printLine(i8* %arraydecay10), !dbg !209
  ret void, !dbg !210
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_06_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 29, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 30, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 30, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 31, column: 10, scope: !11)
!29 = !DILocation(line: 32, column: 5, scope: !11)
!30 = !DILocation(line: 33, column: 5, scope: !11)
!31 = !DILocation(line: 33, column: 25, scope: !11)
!32 = !DILocation(line: 34, column: 5, scope: !11)
!33 = !DILocation(line: 35, column: 5, scope: !11)
!34 = !DILocation(line: 35, column: 27, scope: !11)
!35 = !DILocation(line: 39, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !12, line: 37, column: 5)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 8)
!38 = !DILocation(line: 39, column: 14, scope: !36)
!39 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 42, column: 16, scope: !40)
!45 = !DILocalVariable(name: "destLen", scope: !40, file: !12, line: 42, type: !41)
!46 = !DILocation(line: 42, column: 19, scope: !40)
!47 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 43, type: !25)
!48 = !DILocation(line: 43, column: 14, scope: !40)
!49 = !DILocation(line: 44, column: 9, scope: !40)
!50 = !DILocation(line: 45, column: 9, scope: !40)
!51 = !DILocation(line: 45, column: 21, scope: !40)
!52 = !DILocation(line: 46, column: 26, scope: !40)
!53 = !DILocation(line: 46, column: 19, scope: !40)
!54 = !DILocation(line: 46, column: 17, scope: !40)
!55 = !DILocation(line: 49, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !12, line: 49, column: 9)
!57 = !DILocation(line: 49, column: 14, scope: !56)
!58 = !DILocation(line: 49, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 49, column: 9)
!60 = !DILocation(line: 49, column: 25, scope: !59)
!61 = !DILocation(line: 49, column: 23, scope: !59)
!62 = !DILocation(line: 49, column: 9, scope: !56)
!63 = !DILocation(line: 51, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !12, line: 50, column: 9)
!65 = !DILocation(line: 51, column: 28, scope: !64)
!66 = !DILocation(line: 51, column: 18, scope: !64)
!67 = !DILocation(line: 51, column: 13, scope: !64)
!68 = !DILocation(line: 51, column: 21, scope: !64)
!69 = !DILocation(line: 52, column: 9, scope: !64)
!70 = !DILocation(line: 49, column: 35, scope: !59)
!71 = !DILocation(line: 49, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 52, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 53, column: 9, scope: !40)
!76 = !DILocation(line: 53, column: 21, scope: !40)
!77 = !DILocation(line: 54, column: 19, scope: !40)
!78 = !DILocation(line: 54, column: 9, scope: !40)
!79 = !DILocation(line: 56, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_06_good", scope: !12, file: !12, line: 131, type: !13, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 133, column: 5, scope: !80)
!82 = !DILocation(line: 134, column: 5, scope: !80)
!83 = !DILocation(line: 135, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 147, type: !85, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 147, type: !87)
!90 = !DILocation(line: 147, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 147, type: !88)
!92 = !DILocation(line: 147, column: 27, scope: !84)
!93 = !DILocation(line: 150, column: 22, scope: !84)
!94 = !DILocation(line: 150, column: 12, scope: !84)
!95 = !DILocation(line: 150, column: 5, scope: !84)
!96 = !DILocation(line: 152, column: 5, scope: !84)
!97 = !DILocation(line: 153, column: 5, scope: !84)
!98 = !DILocation(line: 154, column: 5, scope: !84)
!99 = !DILocation(line: 157, column: 5, scope: !84)
!100 = !DILocation(line: 158, column: 5, scope: !84)
!101 = !DILocation(line: 159, column: 5, scope: !84)
!102 = !DILocation(line: 161, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 65, type: !16)
!105 = !DILocation(line: 65, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 66, type: !20)
!107 = !DILocation(line: 66, column: 10, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 67, type: !25)
!109 = !DILocation(line: 67, column: 10, scope: !103)
!110 = !DILocation(line: 68, column: 5, scope: !103)
!111 = !DILocation(line: 69, column: 5, scope: !103)
!112 = !DILocation(line: 69, column: 25, scope: !103)
!113 = !DILocation(line: 70, column: 5, scope: !103)
!114 = !DILocation(line: 71, column: 5, scope: !103)
!115 = !DILocation(line: 71, column: 27, scope: !103)
!116 = !DILocation(line: 80, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !12, line: 78, column: 5)
!118 = distinct !DILexicalBlock(scope: !103, file: !12, line: 72, column: 8)
!119 = !DILocation(line: 80, column: 14, scope: !117)
!120 = !DILocalVariable(name: "i", scope: !121, file: !12, line: 83, type: !41)
!121 = distinct !DILexicalBlock(scope: !103, file: !12, line: 82, column: 5)
!122 = !DILocation(line: 83, column: 16, scope: !121)
!123 = !DILocalVariable(name: "destLen", scope: !121, file: !12, line: 83, type: !41)
!124 = !DILocation(line: 83, column: 19, scope: !121)
!125 = !DILocalVariable(name: "dest", scope: !121, file: !12, line: 84, type: !25)
!126 = !DILocation(line: 84, column: 14, scope: !121)
!127 = !DILocation(line: 85, column: 9, scope: !121)
!128 = !DILocation(line: 86, column: 9, scope: !121)
!129 = !DILocation(line: 86, column: 21, scope: !121)
!130 = !DILocation(line: 87, column: 26, scope: !121)
!131 = !DILocation(line: 87, column: 19, scope: !121)
!132 = !DILocation(line: 87, column: 17, scope: !121)
!133 = !DILocation(line: 90, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !121, file: !12, line: 90, column: 9)
!135 = !DILocation(line: 90, column: 14, scope: !134)
!136 = !DILocation(line: 90, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 90, column: 9)
!138 = !DILocation(line: 90, column: 25, scope: !137)
!139 = !DILocation(line: 90, column: 23, scope: !137)
!140 = !DILocation(line: 90, column: 9, scope: !134)
!141 = !DILocation(line: 92, column: 23, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !12, line: 91, column: 9)
!143 = !DILocation(line: 92, column: 28, scope: !142)
!144 = !DILocation(line: 92, column: 18, scope: !142)
!145 = !DILocation(line: 92, column: 13, scope: !142)
!146 = !DILocation(line: 92, column: 21, scope: !142)
!147 = !DILocation(line: 93, column: 9, scope: !142)
!148 = !DILocation(line: 90, column: 35, scope: !137)
!149 = !DILocation(line: 90, column: 9, scope: !137)
!150 = distinct !{!150, !140, !151, !74}
!151 = !DILocation(line: 93, column: 9, scope: !134)
!152 = !DILocation(line: 94, column: 9, scope: !121)
!153 = !DILocation(line: 94, column: 21, scope: !121)
!154 = !DILocation(line: 95, column: 19, scope: !121)
!155 = !DILocation(line: 95, column: 9, scope: !121)
!156 = !DILocation(line: 97, column: 1, scope: !103)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", scope: !157, file: !12, line: 102, type: !16)
!159 = !DILocation(line: 102, column: 12, scope: !157)
!160 = !DILocalVariable(name: "dataBadBuffer", scope: !157, file: !12, line: 103, type: !20)
!161 = !DILocation(line: 103, column: 10, scope: !157)
!162 = !DILocalVariable(name: "dataGoodBuffer", scope: !157, file: !12, line: 104, type: !25)
!163 = !DILocation(line: 104, column: 10, scope: !157)
!164 = !DILocation(line: 105, column: 5, scope: !157)
!165 = !DILocation(line: 106, column: 5, scope: !157)
!166 = !DILocation(line: 106, column: 25, scope: !157)
!167 = !DILocation(line: 107, column: 5, scope: !157)
!168 = !DILocation(line: 108, column: 5, scope: !157)
!169 = !DILocation(line: 108, column: 27, scope: !157)
!170 = !DILocation(line: 112, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !172, file: !12, line: 110, column: 5)
!172 = distinct !DILexicalBlock(scope: !157, file: !12, line: 109, column: 8)
!173 = !DILocation(line: 112, column: 14, scope: !171)
!174 = !DILocalVariable(name: "i", scope: !175, file: !12, line: 115, type: !41)
!175 = distinct !DILexicalBlock(scope: !157, file: !12, line: 114, column: 5)
!176 = !DILocation(line: 115, column: 16, scope: !175)
!177 = !DILocalVariable(name: "destLen", scope: !175, file: !12, line: 115, type: !41)
!178 = !DILocation(line: 115, column: 19, scope: !175)
!179 = !DILocalVariable(name: "dest", scope: !175, file: !12, line: 116, type: !25)
!180 = !DILocation(line: 116, column: 14, scope: !175)
!181 = !DILocation(line: 117, column: 9, scope: !175)
!182 = !DILocation(line: 118, column: 9, scope: !175)
!183 = !DILocation(line: 118, column: 21, scope: !175)
!184 = !DILocation(line: 119, column: 26, scope: !175)
!185 = !DILocation(line: 119, column: 19, scope: !175)
!186 = !DILocation(line: 119, column: 17, scope: !175)
!187 = !DILocation(line: 122, column: 16, scope: !188)
!188 = distinct !DILexicalBlock(scope: !175, file: !12, line: 122, column: 9)
!189 = !DILocation(line: 122, column: 14, scope: !188)
!190 = !DILocation(line: 122, column: 21, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !12, line: 122, column: 9)
!192 = !DILocation(line: 122, column: 25, scope: !191)
!193 = !DILocation(line: 122, column: 23, scope: !191)
!194 = !DILocation(line: 122, column: 9, scope: !188)
!195 = !DILocation(line: 124, column: 23, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !12, line: 123, column: 9)
!197 = !DILocation(line: 124, column: 28, scope: !196)
!198 = !DILocation(line: 124, column: 18, scope: !196)
!199 = !DILocation(line: 124, column: 13, scope: !196)
!200 = !DILocation(line: 124, column: 21, scope: !196)
!201 = !DILocation(line: 125, column: 9, scope: !196)
!202 = !DILocation(line: 122, column: 35, scope: !191)
!203 = !DILocation(line: 122, column: 9, scope: !191)
!204 = distinct !{!204, !194, !205, !74}
!205 = !DILocation(line: 125, column: 9, scope: !188)
!206 = !DILocation(line: 126, column: 9, scope: !175)
!207 = !DILocation(line: 126, column: 21, scope: !175)
!208 = !DILocation(line: 127, column: 19, scope: !175)
!209 = !DILocation(line: 127, column: 9, scope: !175)
!210 = !DILocation(line: 129, column: 1, scope: !157)
