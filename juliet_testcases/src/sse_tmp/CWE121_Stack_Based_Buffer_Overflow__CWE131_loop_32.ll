; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !25, metadata !DIExpression()), !dbg !27
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !28
  %1 = load i32*, i32** %0, align 8, !dbg !29
  store i32* %1, i32** %data1, align 8, !dbg !27
  %2 = alloca i8, i64 10, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %data1, align 8, !dbg !32
  %4 = load i32*, i32** %data1, align 8, !dbg !33
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !34
  store i32* %4, i32** %5, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !36, metadata !DIExpression()), !dbg !38
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !39
  %7 = load i32*, i32** %6, align 8, !dbg !40
  store i32* %7, i32** %data2, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %8 = bitcast [10 x i32]* %source to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %9, 10, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %10, !dbg !61
  %11 = load i32, i32* %arrayidx, align 4, !dbg !61
  %12 = load i32*, i32** %data2, align 8, !dbg !62
  %13 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !62
  store i32 %11, i32* %arrayidx3, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %14, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !71
  %arrayidx4 = getelementptr inbounds i32, i32* %15, i64 0, !dbg !71
  %16 = load i32, i32* %arrayidx4, align 4, !dbg !71
  call void @printIntLine(i32 %16), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32_good() #0 !dbg !74 {
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
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !100, metadata !DIExpression()), !dbg !101
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !102, metadata !DIExpression()), !dbg !103
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !103
  store i32* null, i32** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !108
  %1 = load i32*, i32** %0, align 8, !dbg !109
  store i32* %1, i32** %data1, align 8, !dbg !107
  %2 = alloca i8, i64 40, align 16, !dbg !110
  %3 = bitcast i8* %2 to i32*, !dbg !111
  store i32* %3, i32** %data1, align 8, !dbg !112
  %4 = load i32*, i32** %data1, align 8, !dbg !113
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !114
  store i32* %4, i32** %5, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !116, metadata !DIExpression()), !dbg !118
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !119
  %7 = load i32*, i32** %6, align 8, !dbg !120
  store i32* %7, i32** %data2, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %8 = bitcast [10 x i32]* %source to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %9, 10, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %10, !dbg !135
  %11 = load i32, i32* %arrayidx, align 4, !dbg !135
  %12 = load i32*, i32** %data2, align 8, !dbg !136
  %13 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !136
  store i32 %11, i32* %arrayidx3, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %14, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds i32, i32* %15, i64 0, !dbg !144
  %16 = load i32, i32* %arrayidx4, align 4, !dbg !144
  call void @printIntLine(i32 %16), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 24, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DILocation(line: 24, column: 12, scope: !13)
!22 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 25, type: !20)
!23 = !DILocation(line: 25, column: 12, scope: !13)
!24 = !DILocation(line: 26, column: 10, scope: !13)
!25 = !DILocalVariable(name: "data", scope: !26, file: !14, line: 28, type: !4)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!27 = !DILocation(line: 28, column: 15, scope: !26)
!28 = !DILocation(line: 28, column: 23, scope: !26)
!29 = !DILocation(line: 28, column: 22, scope: !26)
!30 = !DILocation(line: 30, column: 23, scope: !26)
!31 = !DILocation(line: 30, column: 16, scope: !26)
!32 = !DILocation(line: 30, column: 14, scope: !26)
!33 = !DILocation(line: 31, column: 21, scope: !26)
!34 = !DILocation(line: 31, column: 10, scope: !26)
!35 = !DILocation(line: 31, column: 19, scope: !26)
!36 = !DILocalVariable(name: "data", scope: !37, file: !14, line: 34, type: !4)
!37 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!38 = !DILocation(line: 34, column: 15, scope: !37)
!39 = !DILocation(line: 34, column: 23, scope: !37)
!40 = !DILocation(line: 34, column: 22, scope: !37)
!41 = !DILocalVariable(name: "source", scope: !42, file: !14, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !37, file: !14, line: 35, column: 9)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 10)
!46 = !DILocation(line: 36, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !14, line: 37, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 37, column: 20, scope: !42)
!52 = !DILocation(line: 39, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !42, file: !14, line: 39, column: 13)
!54 = !DILocation(line: 39, column: 18, scope: !53)
!55 = !DILocation(line: 39, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !14, line: 39, column: 13)
!57 = !DILocation(line: 39, column: 27, scope: !56)
!58 = !DILocation(line: 39, column: 13, scope: !53)
!59 = !DILocation(line: 41, column: 34, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !14, line: 40, column: 13)
!61 = !DILocation(line: 41, column: 27, scope: !60)
!62 = !DILocation(line: 41, column: 17, scope: !60)
!63 = !DILocation(line: 41, column: 22, scope: !60)
!64 = !DILocation(line: 41, column: 25, scope: !60)
!65 = !DILocation(line: 42, column: 13, scope: !60)
!66 = !DILocation(line: 39, column: 34, scope: !56)
!67 = !DILocation(line: 39, column: 13, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 42, column: 13, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 43, column: 26, scope: !42)
!72 = !DILocation(line: 43, column: 13, scope: !42)
!73 = !DILocation(line: 46, column: 1, scope: !13)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_32_good", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 82, column: 5, scope: !74)
!76 = !DILocation(line: 83, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !78, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!5, !5, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !14, line: 94, type: !5)
!84 = !DILocation(line: 94, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !14, line: 94, type: !80)
!86 = !DILocation(line: 94, column: 27, scope: !77)
!87 = !DILocation(line: 97, column: 22, scope: !77)
!88 = !DILocation(line: 97, column: 12, scope: !77)
!89 = !DILocation(line: 97, column: 5, scope: !77)
!90 = !DILocation(line: 99, column: 5, scope: !77)
!91 = !DILocation(line: 100, column: 5, scope: !77)
!92 = !DILocation(line: 101, column: 5, scope: !77)
!93 = !DILocation(line: 104, column: 5, scope: !77)
!94 = !DILocation(line: 105, column: 5, scope: !77)
!95 = !DILocation(line: 106, column: 5, scope: !77)
!96 = !DILocation(line: 108, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 55, type: !4)
!99 = !DILocation(line: 55, column: 11, scope: !97)
!100 = !DILocalVariable(name: "dataPtr1", scope: !97, file: !14, line: 56, type: !20)
!101 = !DILocation(line: 56, column: 12, scope: !97)
!102 = !DILocalVariable(name: "dataPtr2", scope: !97, file: !14, line: 57, type: !20)
!103 = !DILocation(line: 57, column: 12, scope: !97)
!104 = !DILocation(line: 58, column: 10, scope: !97)
!105 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 60, type: !4)
!106 = distinct !DILexicalBlock(scope: !97, file: !14, line: 59, column: 5)
!107 = !DILocation(line: 60, column: 15, scope: !106)
!108 = !DILocation(line: 60, column: 23, scope: !106)
!109 = !DILocation(line: 60, column: 22, scope: !106)
!110 = !DILocation(line: 62, column: 23, scope: !106)
!111 = !DILocation(line: 62, column: 16, scope: !106)
!112 = !DILocation(line: 62, column: 14, scope: !106)
!113 = !DILocation(line: 63, column: 21, scope: !106)
!114 = !DILocation(line: 63, column: 10, scope: !106)
!115 = !DILocation(line: 63, column: 19, scope: !106)
!116 = !DILocalVariable(name: "data", scope: !117, file: !14, line: 66, type: !4)
!117 = distinct !DILexicalBlock(scope: !97, file: !14, line: 65, column: 5)
!118 = !DILocation(line: 66, column: 15, scope: !117)
!119 = !DILocation(line: 66, column: 23, scope: !117)
!120 = !DILocation(line: 66, column: 22, scope: !117)
!121 = !DILocalVariable(name: "source", scope: !122, file: !14, line: 68, type: !43)
!122 = distinct !DILexicalBlock(scope: !117, file: !14, line: 67, column: 9)
!123 = !DILocation(line: 68, column: 17, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !14, line: 69, type: !48)
!125 = !DILocation(line: 69, column: 20, scope: !122)
!126 = !DILocation(line: 71, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !14, line: 71, column: 13)
!128 = !DILocation(line: 71, column: 18, scope: !127)
!129 = !DILocation(line: 71, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !14, line: 71, column: 13)
!131 = !DILocation(line: 71, column: 27, scope: !130)
!132 = !DILocation(line: 71, column: 13, scope: !127)
!133 = !DILocation(line: 73, column: 34, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !14, line: 72, column: 13)
!135 = !DILocation(line: 73, column: 27, scope: !134)
!136 = !DILocation(line: 73, column: 17, scope: !134)
!137 = !DILocation(line: 73, column: 22, scope: !134)
!138 = !DILocation(line: 73, column: 25, scope: !134)
!139 = !DILocation(line: 74, column: 13, scope: !134)
!140 = !DILocation(line: 71, column: 34, scope: !130)
!141 = !DILocation(line: 71, column: 13, scope: !130)
!142 = distinct !{!142, !132, !143, !70}
!143 = !DILocation(line: 74, column: 13, scope: !127)
!144 = !DILocation(line: 75, column: 26, scope: !122)
!145 = !DILocation(line: 75, column: 13, scope: !122)
!146 = !DILocation(line: 78, column: 1, scope: !97)
