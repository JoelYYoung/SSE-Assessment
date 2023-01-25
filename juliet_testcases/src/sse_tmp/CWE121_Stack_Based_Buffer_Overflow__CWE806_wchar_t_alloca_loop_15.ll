; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !28
  %4 = load i32*, i32** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !41, metadata !DIExpression()), !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !44
  store i64 %call1, i64* %dataLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !49
  %8 = load i64, i64* %dataLen, align 8, !dbg !51
  %cmp = icmp ult i64 %7, %8, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !54
  %10 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !54
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !54
  %12 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !58
  store i32 %11, i32* %arrayidx3, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %13, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !66
  store i32 0, i32* %arrayidx4, align 4, !dbg !67
  %14 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %14), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 400, align 16, !dbg !100
  %1 = bitcast i8* %0 to i32*, !dbg !101
  store i32* %1, i32** %dataBuffer, align 8, !dbg !99
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  store i32* %2, i32** %data, align 8, !dbg !103
  %3 = load i32*, i32** %data, align 8, !dbg !104
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !113, metadata !DIExpression()), !dbg !114
  %6 = load i32*, i32** %data, align 8, !dbg !115
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !116
  store i64 %call1, i64* %dataLen, align 8, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !121
  %8 = load i64, i64* %dataLen, align 8, !dbg !123
  %cmp = icmp ult i64 %7, %8, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !126
  %10 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !126
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !126
  %12 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !130
  store i32 %11, i32* %arrayidx3, align 4, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %13, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !137
  store i32 0, i32* %arrayidx4, align 4, !dbg !138
  %14 = load i32*, i32** %data, align 8, !dbg !139
  call void @printWLine(i32* %14), !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = alloca i8, i64 400, align 16, !dbg !147
  %1 = bitcast i8* %0 to i32*, !dbg !148
  store i32* %1, i32** %dataBuffer, align 8, !dbg !146
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !149
  store i32* %2, i32** %data, align 8, !dbg !150
  %3 = load i32*, i32** %data, align 8, !dbg !151
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !152
  %4 = load i32*, i32** %data, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !153
  store i32 0, i32* %arrayidx, align 4, !dbg !154
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !155, metadata !DIExpression()), !dbg !157
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !157
  call void @llvm.dbg.declare(metadata i64* %i, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !160, metadata !DIExpression()), !dbg !161
  %6 = load i32*, i32** %data, align 8, !dbg !162
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !163
  store i64 %call1, i64* %dataLen, align 8, !dbg !164
  store i64 0, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !168
  %8 = load i64, i64* %dataLen, align 8, !dbg !170
  %cmp = icmp ult i64 %7, %8, !dbg !171
  br i1 %cmp, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !173
  %10 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !173
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !173
  %12 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !177
  store i32 %11, i32* %arrayidx3, align 4, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !180
  %inc = add i64 %13, 1, !dbg !180
  store i64 %inc, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !184
  store i32 0, i32* %arrayidx4, align 4, !dbg !185
  %14 = load i32*, i32** %data, align 8, !dbg !186
  call void @printWLine(i32* %14), !dbg !187
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 32, column: 17, scope: !15)
!28 = !DILocation(line: 32, column: 9, scope: !15)
!29 = !DILocation(line: 33, column: 9, scope: !15)
!30 = !DILocation(line: 33, column: 21, scope: !15)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !16, line: 41, type: !33)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 41, column: 17, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !16, line: 42, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !39)
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 42, column: 16, scope: !32)
!41 = !DILocalVariable(name: "dataLen", scope: !32, file: !16, line: 42, type: !38)
!42 = !DILocation(line: 42, column: 19, scope: !32)
!43 = !DILocation(line: 43, column: 26, scope: !32)
!44 = !DILocation(line: 43, column: 19, scope: !32)
!45 = !DILocation(line: 43, column: 17, scope: !32)
!46 = !DILocation(line: 45, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !32, file: !16, line: 45, column: 9)
!48 = !DILocation(line: 45, column: 14, scope: !47)
!49 = !DILocation(line: 45, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !16, line: 45, column: 9)
!51 = !DILocation(line: 45, column: 25, scope: !50)
!52 = !DILocation(line: 45, column: 23, scope: !50)
!53 = !DILocation(line: 45, column: 9, scope: !47)
!54 = !DILocation(line: 47, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !16, line: 46, column: 9)
!56 = !DILocation(line: 47, column: 28, scope: !55)
!57 = !DILocation(line: 47, column: 18, scope: !55)
!58 = !DILocation(line: 47, column: 13, scope: !55)
!59 = !DILocation(line: 47, column: 21, scope: !55)
!60 = !DILocation(line: 48, column: 9, scope: !55)
!61 = !DILocation(line: 45, column: 35, scope: !50)
!62 = !DILocation(line: 45, column: 9, scope: !50)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 48, column: 9, scope: !47)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 49, column: 9, scope: !32)
!67 = !DILocation(line: 49, column: 20, scope: !32)
!68 = !DILocation(line: 50, column: 20, scope: !32)
!69 = !DILocation(line: 50, column: 9, scope: !32)
!70 = !DILocation(line: 52, column: 1, scope: !15)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_15_good", scope: !16, file: !16, line: 122, type: !17, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 124, column: 5, scope: !71)
!73 = !DILocation(line: 125, column: 5, scope: !71)
!74 = !DILocation(line: 126, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 138, type: !76, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!7, !7, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !16, line: 138, type: !7)
!82 = !DILocation(line: 138, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !16, line: 138, type: !78)
!84 = !DILocation(line: 138, column: 27, scope: !75)
!85 = !DILocation(line: 141, column: 22, scope: !75)
!86 = !DILocation(line: 141, column: 12, scope: !75)
!87 = !DILocation(line: 141, column: 5, scope: !75)
!88 = !DILocation(line: 143, column: 5, scope: !75)
!89 = !DILocation(line: 144, column: 5, scope: !75)
!90 = !DILocation(line: 145, column: 5, scope: !75)
!91 = !DILocation(line: 148, column: 5, scope: !75)
!92 = !DILocation(line: 149, column: 5, scope: !75)
!93 = !DILocation(line: 150, column: 5, scope: !75)
!94 = !DILocation(line: 152, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !16, line: 61, type: !4)
!97 = !DILocation(line: 61, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !16, line: 62, type: !4)
!99 = !DILocation(line: 62, column: 15, scope: !95)
!100 = !DILocation(line: 62, column: 39, scope: !95)
!101 = !DILocation(line: 62, column: 28, scope: !95)
!102 = !DILocation(line: 63, column: 12, scope: !95)
!103 = !DILocation(line: 63, column: 10, scope: !95)
!104 = !DILocation(line: 72, column: 17, scope: !95)
!105 = !DILocation(line: 72, column: 9, scope: !95)
!106 = !DILocation(line: 73, column: 9, scope: !95)
!107 = !DILocation(line: 73, column: 20, scope: !95)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !16, line: 77, type: !33)
!109 = distinct !DILexicalBlock(scope: !95, file: !16, line: 76, column: 5)
!110 = !DILocation(line: 77, column: 17, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !109, file: !16, line: 78, type: !38)
!112 = !DILocation(line: 78, column: 16, scope: !109)
!113 = !DILocalVariable(name: "dataLen", scope: !109, file: !16, line: 78, type: !38)
!114 = !DILocation(line: 78, column: 19, scope: !109)
!115 = !DILocation(line: 79, column: 26, scope: !109)
!116 = !DILocation(line: 79, column: 19, scope: !109)
!117 = !DILocation(line: 79, column: 17, scope: !109)
!118 = !DILocation(line: 81, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !16, line: 81, column: 9)
!120 = !DILocation(line: 81, column: 14, scope: !119)
!121 = !DILocation(line: 81, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !16, line: 81, column: 9)
!123 = !DILocation(line: 81, column: 25, scope: !122)
!124 = !DILocation(line: 81, column: 23, scope: !122)
!125 = !DILocation(line: 81, column: 9, scope: !119)
!126 = !DILocation(line: 83, column: 23, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !16, line: 82, column: 9)
!128 = !DILocation(line: 83, column: 28, scope: !127)
!129 = !DILocation(line: 83, column: 18, scope: !127)
!130 = !DILocation(line: 83, column: 13, scope: !127)
!131 = !DILocation(line: 83, column: 21, scope: !127)
!132 = !DILocation(line: 84, column: 9, scope: !127)
!133 = !DILocation(line: 81, column: 35, scope: !122)
!134 = !DILocation(line: 81, column: 9, scope: !122)
!135 = distinct !{!135, !125, !136, !65}
!136 = !DILocation(line: 84, column: 9, scope: !119)
!137 = !DILocation(line: 85, column: 9, scope: !109)
!138 = !DILocation(line: 85, column: 20, scope: !109)
!139 = !DILocation(line: 86, column: 20, scope: !109)
!140 = !DILocation(line: 86, column: 9, scope: !109)
!141 = !DILocation(line: 88, column: 1, scope: !95)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !16, line: 93, type: !4)
!144 = !DILocation(line: 93, column: 15, scope: !142)
!145 = !DILocalVariable(name: "dataBuffer", scope: !142, file: !16, line: 94, type: !4)
!146 = !DILocation(line: 94, column: 15, scope: !142)
!147 = !DILocation(line: 94, column: 39, scope: !142)
!148 = !DILocation(line: 94, column: 28, scope: !142)
!149 = !DILocation(line: 95, column: 12, scope: !142)
!150 = !DILocation(line: 95, column: 10, scope: !142)
!151 = !DILocation(line: 100, column: 17, scope: !142)
!152 = !DILocation(line: 100, column: 9, scope: !142)
!153 = !DILocation(line: 101, column: 9, scope: !142)
!154 = !DILocation(line: 101, column: 20, scope: !142)
!155 = !DILocalVariable(name: "dest", scope: !156, file: !16, line: 109, type: !33)
!156 = distinct !DILexicalBlock(scope: !142, file: !16, line: 108, column: 5)
!157 = !DILocation(line: 109, column: 17, scope: !156)
!158 = !DILocalVariable(name: "i", scope: !156, file: !16, line: 110, type: !38)
!159 = !DILocation(line: 110, column: 16, scope: !156)
!160 = !DILocalVariable(name: "dataLen", scope: !156, file: !16, line: 110, type: !38)
!161 = !DILocation(line: 110, column: 19, scope: !156)
!162 = !DILocation(line: 111, column: 26, scope: !156)
!163 = !DILocation(line: 111, column: 19, scope: !156)
!164 = !DILocation(line: 111, column: 17, scope: !156)
!165 = !DILocation(line: 113, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !156, file: !16, line: 113, column: 9)
!167 = !DILocation(line: 113, column: 14, scope: !166)
!168 = !DILocation(line: 113, column: 21, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !16, line: 113, column: 9)
!170 = !DILocation(line: 113, column: 25, scope: !169)
!171 = !DILocation(line: 113, column: 23, scope: !169)
!172 = !DILocation(line: 113, column: 9, scope: !166)
!173 = !DILocation(line: 115, column: 23, scope: !174)
!174 = distinct !DILexicalBlock(scope: !169, file: !16, line: 114, column: 9)
!175 = !DILocation(line: 115, column: 28, scope: !174)
!176 = !DILocation(line: 115, column: 18, scope: !174)
!177 = !DILocation(line: 115, column: 13, scope: !174)
!178 = !DILocation(line: 115, column: 21, scope: !174)
!179 = !DILocation(line: 116, column: 9, scope: !174)
!180 = !DILocation(line: 113, column: 35, scope: !169)
!181 = !DILocation(line: 113, column: 9, scope: !169)
!182 = distinct !{!182, !172, !183, !65}
!183 = !DILocation(line: 116, column: 9, scope: !166)
!184 = !DILocation(line: 117, column: 9, scope: !156)
!185 = !DILocation(line: 117, column: 20, scope: !156)
!186 = !DILocation(line: 118, column: 20, scope: !156)
!187 = !DILocation(line: 118, column: 9, scope: !156)
!188 = !DILocation(line: 120, column: 1, scope: !142)
