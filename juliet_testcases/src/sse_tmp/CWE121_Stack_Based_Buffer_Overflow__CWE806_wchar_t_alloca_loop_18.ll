; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18_bad() #0 !dbg !15 {
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
  br label %source, !dbg !27

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !28), !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !31
  %4 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !45
  %6 = load i32*, i32** %data, align 8, !dbg !46
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !47
  store i64 %call1, i64* %dataLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %source
  %7 = load i64, i64* %i, align 8, !dbg !52
  %8 = load i64, i64* %dataLen, align 8, !dbg !54
  %cmp = icmp ult i64 %7, %8, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !57
  %10 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !57
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !57
  %12 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !61
  store i32 %11, i32* %arrayidx3, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %13, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !69
  store i32 0, i32* %arrayidx4, align 4, !dbg !70
  %14 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %14), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #6, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #6, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 400, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBuffer, align 8, !dbg !101
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  store i32* %2, i32** %data, align 8, !dbg !105
  br label %source, !dbg !106

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !107), !dbg !108
  %3 = load i32*, i32** %data, align 8, !dbg !109
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !110
  %4 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !118, metadata !DIExpression()), !dbg !119
  %6 = load i32*, i32** %data, align 8, !dbg !120
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !121
  store i64 %call1, i64* %dataLen, align 8, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %source
  %7 = load i64, i64* %i, align 8, !dbg !126
  %8 = load i64, i64* %dataLen, align 8, !dbg !128
  %cmp = icmp ult i64 %7, %8, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !131
  %10 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !131
  %11 = load i32, i32* %arrayidx2, align 4, !dbg !131
  %12 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !135
  store i32 %11, i32* %arrayidx3, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %13, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !142
  store i32 0, i32* %arrayidx4, align 4, !dbg !143
  %14 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* %14), !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILabel(scope: !15, name: "source", file: !16, line: 29)
!29 = !DILocation(line: 29, column: 1, scope: !15)
!30 = !DILocation(line: 31, column: 13, scope: !15)
!31 = !DILocation(line: 31, column: 5, scope: !15)
!32 = !DILocation(line: 32, column: 5, scope: !15)
!33 = !DILocation(line: 32, column: 17, scope: !15)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !16, line: 34, type: !36)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 34, column: 17, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !16, line: 35, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 35, column: 16, scope: !35)
!44 = !DILocalVariable(name: "dataLen", scope: !35, file: !16, line: 35, type: !41)
!45 = !DILocation(line: 35, column: 19, scope: !35)
!46 = !DILocation(line: 36, column: 26, scope: !35)
!47 = !DILocation(line: 36, column: 19, scope: !35)
!48 = !DILocation(line: 36, column: 17, scope: !35)
!49 = !DILocation(line: 38, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !35, file: !16, line: 38, column: 9)
!51 = !DILocation(line: 38, column: 14, scope: !50)
!52 = !DILocation(line: 38, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !16, line: 38, column: 9)
!54 = !DILocation(line: 38, column: 25, scope: !53)
!55 = !DILocation(line: 38, column: 23, scope: !53)
!56 = !DILocation(line: 38, column: 9, scope: !50)
!57 = !DILocation(line: 40, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !16, line: 39, column: 9)
!59 = !DILocation(line: 40, column: 28, scope: !58)
!60 = !DILocation(line: 40, column: 18, scope: !58)
!61 = !DILocation(line: 40, column: 13, scope: !58)
!62 = !DILocation(line: 40, column: 21, scope: !58)
!63 = !DILocation(line: 41, column: 9, scope: !58)
!64 = !DILocation(line: 38, column: 35, scope: !53)
!65 = !DILocation(line: 38, column: 9, scope: !53)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 41, column: 9, scope: !50)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 42, column: 9, scope: !35)
!70 = !DILocation(line: 42, column: 20, scope: !35)
!71 = !DILocation(line: 43, column: 20, scope: !35)
!72 = !DILocation(line: 43, column: 9, scope: !35)
!73 = !DILocation(line: 45, column: 1, scope: !15)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_18_good", scope: !16, file: !16, line: 76, type: !17, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 78, column: 5, scope: !74)
!76 = !DILocation(line: 79, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 91, type: !78, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7, !7, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !16, line: 91, type: !7)
!84 = !DILocation(line: 91, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !16, line: 91, type: !80)
!86 = !DILocation(line: 91, column: 27, scope: !77)
!87 = !DILocation(line: 94, column: 22, scope: !77)
!88 = !DILocation(line: 94, column: 12, scope: !77)
!89 = !DILocation(line: 94, column: 5, scope: !77)
!90 = !DILocation(line: 96, column: 5, scope: !77)
!91 = !DILocation(line: 97, column: 5, scope: !77)
!92 = !DILocation(line: 98, column: 5, scope: !77)
!93 = !DILocation(line: 101, column: 5, scope: !77)
!94 = !DILocation(line: 102, column: 5, scope: !77)
!95 = !DILocation(line: 103, column: 5, scope: !77)
!96 = !DILocation(line: 105, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !16, line: 54, type: !4)
!99 = !DILocation(line: 54, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !16, line: 55, type: !4)
!101 = !DILocation(line: 55, column: 15, scope: !97)
!102 = !DILocation(line: 55, column: 39, scope: !97)
!103 = !DILocation(line: 55, column: 28, scope: !97)
!104 = !DILocation(line: 56, column: 12, scope: !97)
!105 = !DILocation(line: 56, column: 10, scope: !97)
!106 = !DILocation(line: 57, column: 5, scope: !97)
!107 = !DILabel(scope: !97, name: "source", file: !16, line: 58)
!108 = !DILocation(line: 58, column: 1, scope: !97)
!109 = !DILocation(line: 60, column: 13, scope: !97)
!110 = !DILocation(line: 60, column: 5, scope: !97)
!111 = !DILocation(line: 61, column: 5, scope: !97)
!112 = !DILocation(line: 61, column: 16, scope: !97)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !16, line: 63, type: !36)
!114 = distinct !DILexicalBlock(scope: !97, file: !16, line: 62, column: 5)
!115 = !DILocation(line: 63, column: 17, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !114, file: !16, line: 64, type: !41)
!117 = !DILocation(line: 64, column: 16, scope: !114)
!118 = !DILocalVariable(name: "dataLen", scope: !114, file: !16, line: 64, type: !41)
!119 = !DILocation(line: 64, column: 19, scope: !114)
!120 = !DILocation(line: 65, column: 26, scope: !114)
!121 = !DILocation(line: 65, column: 19, scope: !114)
!122 = !DILocation(line: 65, column: 17, scope: !114)
!123 = !DILocation(line: 67, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !16, line: 67, column: 9)
!125 = !DILocation(line: 67, column: 14, scope: !124)
!126 = !DILocation(line: 67, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !16, line: 67, column: 9)
!128 = !DILocation(line: 67, column: 25, scope: !127)
!129 = !DILocation(line: 67, column: 23, scope: !127)
!130 = !DILocation(line: 67, column: 9, scope: !124)
!131 = !DILocation(line: 69, column: 23, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !16, line: 68, column: 9)
!133 = !DILocation(line: 69, column: 28, scope: !132)
!134 = !DILocation(line: 69, column: 18, scope: !132)
!135 = !DILocation(line: 69, column: 13, scope: !132)
!136 = !DILocation(line: 69, column: 21, scope: !132)
!137 = !DILocation(line: 70, column: 9, scope: !132)
!138 = !DILocation(line: 67, column: 35, scope: !127)
!139 = !DILocation(line: 67, column: 9, scope: !127)
!140 = distinct !{!140, !130, !141, !68}
!141 = !DILocation(line: 70, column: 9, scope: !124)
!142 = !DILocation(line: 71, column: 9, scope: !114)
!143 = !DILocation(line: 71, column: 20, scope: !114)
!144 = !DILocation(line: 72, column: 20, scope: !114)
!145 = !DILocation(line: 72, column: 9, scope: !114)
!146 = !DILocation(line: 74, column: 1, scope: !97)
