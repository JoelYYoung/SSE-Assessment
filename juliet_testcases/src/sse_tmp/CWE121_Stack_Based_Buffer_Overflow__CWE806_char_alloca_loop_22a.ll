; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !10
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !14
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  store i8* %1, i8** %data, align 8, !dbg !31
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_badGlobal, align 4, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_badSource(i8* %2), !dbg !34
  store i8* %call, i8** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !47, metadata !DIExpression()), !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !50
  store i64 %call1, i64* %dataLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !55
  %6 = load i64, i64* %dataLen, align 8, !dbg !57
  %cmp = icmp ult i64 %5, %6, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !60
  %8 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !60
  %9 = load i8, i8* %arrayidx, align 1, !dbg !60
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !64
  store i8 %9, i8* %arrayidx2, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %11, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !72
  store i8 0, i8* %arrayidx3, align 1, !dbg !73
  %12 = load i8*, i8** %data, align 8, !dbg !74
  call void @printLine(i8* %12), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 100, align 16, !dbg !104
  store i8* %0, i8** %dataBuffer, align 8, !dbg !103
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  store i8* %1, i8** %data, align 8, !dbg !106
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B1Global, align 4, !dbg !107
  %2 = load i8*, i8** %data, align 8, !dbg !108
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B1Source(i8* %2), !dbg !109
  store i8* %call, i8** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !116, metadata !DIExpression()), !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !119
  store i64 %call1, i64* %dataLen, align 8, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !124
  %6 = load i64, i64* %dataLen, align 8, !dbg !126
  %cmp = icmp ult i64 %5, %6, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !129
  %8 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !129
  %9 = load i8, i8* %arrayidx, align 1, !dbg !129
  %10 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !133
  store i8 %9, i8* %arrayidx2, align 1, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %11, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !140
  store i8 0, i8* %arrayidx3, align 1, !dbg !141
  %12 = load i8*, i8** %data, align 8, !dbg !142
  call void @printLine(i8* %12), !dbg !143
  ret void, !dbg !144
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = alloca i8, i64 100, align 16, !dbg !150
  store i8* %0, i8** %dataBuffer, align 8, !dbg !149
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !151
  store i8* %1, i8** %data, align 8, !dbg !152
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B2Global, align 4, !dbg !153
  %2 = load i8*, i8** %data, align 8, !dbg !154
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B2Source(i8* %2), !dbg !155
  store i8* %call, i8** %data, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !157, metadata !DIExpression()), !dbg !159
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !162, metadata !DIExpression()), !dbg !163
  %4 = load i8*, i8** %data, align 8, !dbg !164
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !165
  store i64 %call1, i64* %dataLen, align 8, !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !170
  %6 = load i64, i64* %dataLen, align 8, !dbg !172
  %cmp = icmp ult i64 %5, %6, !dbg !173
  br i1 %cmp, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !175
  %8 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !175
  %9 = load i8, i8* %arrayidx, align 1, !dbg !175
  %10 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !179
  store i8 %9, i8* %arrayidx2, align 1, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !182
  %inc = add i64 %11, 1, !dbg !182
  store i64 %inc, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !186
  store i8 0, i8* %arrayidx3, align 1, !dbg !187
  %12 = load i8*, i8** %data, align 8, !dbg !188
  call void @printLine(i8* %12), !dbg !189
  ret void, !dbg !190
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_badGlobal", scope: !2, file: !12, line: 24, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B1Global", scope: !2, file: !12, line: 54, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_goodG2B2Global", scope: !2, file: !12, line: 55, type: !13, isLocal: false, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_bad", scope: !12, file: !12, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 30, type: !6)
!26 = !DILocation(line: 30, column: 12, scope: !22)
!27 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !12, line: 31, type: !6)
!28 = !DILocation(line: 31, column: 12, scope: !22)
!29 = !DILocation(line: 31, column: 33, scope: !22)
!30 = !DILocation(line: 32, column: 12, scope: !22)
!31 = !DILocation(line: 32, column: 10, scope: !22)
!32 = !DILocation(line: 33, column: 78, scope: !22)
!33 = !DILocation(line: 34, column: 85, scope: !22)
!34 = !DILocation(line: 34, column: 12, scope: !22)
!35 = !DILocation(line: 34, column: 10, scope: !22)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !22, file: !12, line: 35, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 36, column: 14, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 37, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 37, column: 16, scope: !37)
!47 = !DILocalVariable(name: "dataLen", scope: !37, file: !12, line: 37, type: !43)
!48 = !DILocation(line: 37, column: 19, scope: !37)
!49 = !DILocation(line: 38, column: 26, scope: !37)
!50 = !DILocation(line: 38, column: 19, scope: !37)
!51 = !DILocation(line: 38, column: 17, scope: !37)
!52 = !DILocation(line: 40, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !37, file: !12, line: 40, column: 9)
!54 = !DILocation(line: 40, column: 14, scope: !53)
!55 = !DILocation(line: 40, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 40, column: 9)
!57 = !DILocation(line: 40, column: 25, scope: !56)
!58 = !DILocation(line: 40, column: 23, scope: !56)
!59 = !DILocation(line: 40, column: 9, scope: !53)
!60 = !DILocation(line: 42, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !12, line: 41, column: 9)
!62 = !DILocation(line: 42, column: 28, scope: !61)
!63 = !DILocation(line: 42, column: 18, scope: !61)
!64 = !DILocation(line: 42, column: 13, scope: !61)
!65 = !DILocation(line: 42, column: 21, scope: !61)
!66 = !DILocation(line: 43, column: 9, scope: !61)
!67 = !DILocation(line: 40, column: 35, scope: !56)
!68 = !DILocation(line: 40, column: 9, scope: !56)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 43, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 44, column: 9, scope: !37)
!73 = !DILocation(line: 44, column: 20, scope: !37)
!74 = !DILocation(line: 45, column: 19, scope: !37)
!75 = !DILocation(line: 45, column: 9, scope: !37)
!76 = !DILocation(line: 47, column: 1, scope: !22)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_22_good", scope: !12, file: !12, line: 105, type: !23, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 107, column: 5, scope: !77)
!79 = !DILocation(line: 108, column: 5, scope: !77)
!80 = !DILocation(line: 109, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !82, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DISubroutineType(types: !83)
!83 = !{!13, !13, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 121, type: !13)
!86 = !DILocation(line: 121, column: 14, scope: !81)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 121, type: !84)
!88 = !DILocation(line: 121, column: 27, scope: !81)
!89 = !DILocation(line: 124, column: 22, scope: !81)
!90 = !DILocation(line: 124, column: 12, scope: !81)
!91 = !DILocation(line: 124, column: 5, scope: !81)
!92 = !DILocation(line: 126, column: 5, scope: !81)
!93 = !DILocation(line: 127, column: 5, scope: !81)
!94 = !DILocation(line: 128, column: 5, scope: !81)
!95 = !DILocation(line: 131, column: 5, scope: !81)
!96 = !DILocation(line: 132, column: 5, scope: !81)
!97 = !DILocation(line: 133, column: 5, scope: !81)
!98 = !DILocation(line: 135, column: 5, scope: !81)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !23, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 62, type: !6)
!101 = !DILocation(line: 62, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !12, line: 63, type: !6)
!103 = !DILocation(line: 63, column: 12, scope: !99)
!104 = !DILocation(line: 63, column: 33, scope: !99)
!105 = !DILocation(line: 64, column: 12, scope: !99)
!106 = !DILocation(line: 64, column: 10, scope: !99)
!107 = !DILocation(line: 65, column: 83, scope: !99)
!108 = !DILocation(line: 66, column: 90, scope: !99)
!109 = !DILocation(line: 66, column: 12, scope: !99)
!110 = !DILocation(line: 66, column: 10, scope: !99)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !12, line: 68, type: !38)
!112 = distinct !DILexicalBlock(scope: !99, file: !12, line: 67, column: 5)
!113 = !DILocation(line: 68, column: 14, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 69, type: !43)
!115 = !DILocation(line: 69, column: 16, scope: !112)
!116 = !DILocalVariable(name: "dataLen", scope: !112, file: !12, line: 69, type: !43)
!117 = !DILocation(line: 69, column: 19, scope: !112)
!118 = !DILocation(line: 70, column: 26, scope: !112)
!119 = !DILocation(line: 70, column: 19, scope: !112)
!120 = !DILocation(line: 70, column: 17, scope: !112)
!121 = !DILocation(line: 72, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !12, line: 72, column: 9)
!123 = !DILocation(line: 72, column: 14, scope: !122)
!124 = !DILocation(line: 72, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 72, column: 9)
!126 = !DILocation(line: 72, column: 25, scope: !125)
!127 = !DILocation(line: 72, column: 23, scope: !125)
!128 = !DILocation(line: 72, column: 9, scope: !122)
!129 = !DILocation(line: 74, column: 23, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !12, line: 73, column: 9)
!131 = !DILocation(line: 74, column: 28, scope: !130)
!132 = !DILocation(line: 74, column: 18, scope: !130)
!133 = !DILocation(line: 74, column: 13, scope: !130)
!134 = !DILocation(line: 74, column: 21, scope: !130)
!135 = !DILocation(line: 75, column: 9, scope: !130)
!136 = !DILocation(line: 72, column: 35, scope: !125)
!137 = !DILocation(line: 72, column: 9, scope: !125)
!138 = distinct !{!138, !128, !139, !71}
!139 = !DILocation(line: 75, column: 9, scope: !122)
!140 = !DILocation(line: 76, column: 9, scope: !112)
!141 = !DILocation(line: 76, column: 20, scope: !112)
!142 = !DILocation(line: 77, column: 19, scope: !112)
!143 = !DILocation(line: 77, column: 9, scope: !112)
!144 = !DILocation(line: 79, column: 1, scope: !99)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !23, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!146 = !DILocalVariable(name: "data", scope: !145, file: !12, line: 86, type: !6)
!147 = !DILocation(line: 86, column: 12, scope: !145)
!148 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !12, line: 87, type: !6)
!149 = !DILocation(line: 87, column: 12, scope: !145)
!150 = !DILocation(line: 87, column: 33, scope: !145)
!151 = !DILocation(line: 88, column: 12, scope: !145)
!152 = !DILocation(line: 88, column: 10, scope: !145)
!153 = !DILocation(line: 89, column: 83, scope: !145)
!154 = !DILocation(line: 90, column: 90, scope: !145)
!155 = !DILocation(line: 90, column: 12, scope: !145)
!156 = !DILocation(line: 90, column: 10, scope: !145)
!157 = !DILocalVariable(name: "dest", scope: !158, file: !12, line: 92, type: !38)
!158 = distinct !DILexicalBlock(scope: !145, file: !12, line: 91, column: 5)
!159 = !DILocation(line: 92, column: 14, scope: !158)
!160 = !DILocalVariable(name: "i", scope: !158, file: !12, line: 93, type: !43)
!161 = !DILocation(line: 93, column: 16, scope: !158)
!162 = !DILocalVariable(name: "dataLen", scope: !158, file: !12, line: 93, type: !43)
!163 = !DILocation(line: 93, column: 19, scope: !158)
!164 = !DILocation(line: 94, column: 26, scope: !158)
!165 = !DILocation(line: 94, column: 19, scope: !158)
!166 = !DILocation(line: 94, column: 17, scope: !158)
!167 = !DILocation(line: 96, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !158, file: !12, line: 96, column: 9)
!169 = !DILocation(line: 96, column: 14, scope: !168)
!170 = !DILocation(line: 96, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 96, column: 9)
!172 = !DILocation(line: 96, column: 25, scope: !171)
!173 = !DILocation(line: 96, column: 23, scope: !171)
!174 = !DILocation(line: 96, column: 9, scope: !168)
!175 = !DILocation(line: 98, column: 23, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !12, line: 97, column: 9)
!177 = !DILocation(line: 98, column: 28, scope: !176)
!178 = !DILocation(line: 98, column: 18, scope: !176)
!179 = !DILocation(line: 98, column: 13, scope: !176)
!180 = !DILocation(line: 98, column: 21, scope: !176)
!181 = !DILocation(line: 99, column: 9, scope: !176)
!182 = !DILocation(line: 96, column: 35, scope: !171)
!183 = !DILocation(line: 96, column: 9, scope: !171)
!184 = distinct !{!184, !174, !185, !71}
!185 = !DILocation(line: 99, column: 9, scope: !168)
!186 = !DILocation(line: 100, column: 9, scope: !158)
!187 = !DILocation(line: 100, column: 20, scope: !158)
!188 = !DILocation(line: 101, column: 19, scope: !158)
!189 = !DILocation(line: 101, column: 9, scope: !158)
!190 = !DILocation(line: 103, column: 1, scope: !145)
