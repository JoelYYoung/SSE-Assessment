; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @globalFive, align 4, !dbg !28
  %cmp = icmp eq i32 %0, 5, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #5, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %4 = load i32*, i32** %data, align 8, !dbg !45
  %call2 = call i32* @wcscpy(i32* %arraydecay1, i32* %4) #5, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %5), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !79
  store i32* %arraydecay, i32** %data, align 8, !dbg !80
  %0 = load i32, i32* @globalFive, align 4, !dbg !81
  %cmp = icmp ne i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !88
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !90
  %2 = load i32*, i32** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !95
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !96
  %4 = load i32*, i32** %data, align 8, !dbg !97
  %call2 = call i32* @wcscpy(i32* %arraydecay1, i32* %4) #5, !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  call void @printWLine(i32* %5), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay, i32** %data, align 8, !dbg !108
  %0 = load i32, i32* @globalFive, align 4, !dbg !109
  %cmp = icmp eq i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !115
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !121
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !122
  %4 = load i32*, i32** %data, align 8, !dbg !123
  %call2 = call i32* @wcscpy(i32* %arraydecay1, i32* %4) #5, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  call void @printWLine(i32* %5), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 28, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 8, scope: !11)
!32 = !DILocation(line: 31, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 9, scope: !33)
!35 = !DILocation(line: 32, column: 9, scope: !33)
!36 = !DILocation(line: 32, column: 21, scope: !33)
!37 = !DILocation(line: 33, column: 5, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 35, column: 17, scope: !39)
!44 = !DILocation(line: 37, column: 16, scope: !39)
!45 = !DILocation(line: 37, column: 22, scope: !39)
!46 = !DILocation(line: 37, column: 9, scope: !39)
!47 = !DILocation(line: 38, column: 20, scope: !39)
!48 = !DILocation(line: 38, column: 9, scope: !39)
!49 = !DILocation(line: 40, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_14_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 93, column: 5, scope: !50)
!52 = !DILocation(line: 94, column: 5, scope: !50)
!53 = !DILocation(line: 95, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !55, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!19, !19, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 107, type: !19)
!61 = !DILocation(line: 107, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 107, type: !57)
!63 = !DILocation(line: 107, column: 27, scope: !54)
!64 = !DILocation(line: 110, column: 22, scope: !54)
!65 = !DILocation(line: 110, column: 12, scope: !54)
!66 = !DILocation(line: 110, column: 5, scope: !54)
!67 = !DILocation(line: 112, column: 5, scope: !54)
!68 = !DILocation(line: 113, column: 5, scope: !54)
!69 = !DILocation(line: 114, column: 5, scope: !54)
!70 = !DILocation(line: 117, column: 5, scope: !54)
!71 = !DILocation(line: 118, column: 5, scope: !54)
!72 = !DILocation(line: 119, column: 5, scope: !54)
!73 = !DILocation(line: 121, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 49, type: !16)
!76 = !DILocation(line: 49, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 50, type: !22)
!78 = !DILocation(line: 50, column: 13, scope: !74)
!79 = !DILocation(line: 51, column: 12, scope: !74)
!80 = !DILocation(line: 51, column: 10, scope: !74)
!81 = !DILocation(line: 52, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !12, line: 52, column: 8)
!83 = !DILocation(line: 52, column: 18, scope: !82)
!84 = !DILocation(line: 52, column: 8, scope: !74)
!85 = !DILocation(line: 55, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !12, line: 53, column: 5)
!87 = !DILocation(line: 56, column: 5, scope: !86)
!88 = !DILocation(line: 60, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !12, line: 58, column: 5)
!90 = !DILocation(line: 60, column: 9, scope: !89)
!91 = !DILocation(line: 61, column: 9, scope: !89)
!92 = !DILocation(line: 61, column: 20, scope: !89)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !12, line: 64, type: !40)
!94 = distinct !DILexicalBlock(scope: !74, file: !12, line: 63, column: 5)
!95 = !DILocation(line: 64, column: 17, scope: !94)
!96 = !DILocation(line: 66, column: 16, scope: !94)
!97 = !DILocation(line: 66, column: 22, scope: !94)
!98 = !DILocation(line: 66, column: 9, scope: !94)
!99 = !DILocation(line: 67, column: 20, scope: !94)
!100 = !DILocation(line: 67, column: 9, scope: !94)
!101 = !DILocation(line: 69, column: 1, scope: !74)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 74, type: !16)
!104 = !DILocation(line: 74, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 75, type: !22)
!106 = !DILocation(line: 75, column: 13, scope: !102)
!107 = !DILocation(line: 76, column: 12, scope: !102)
!108 = !DILocation(line: 76, column: 10, scope: !102)
!109 = !DILocation(line: 77, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !12, line: 77, column: 8)
!111 = !DILocation(line: 77, column: 18, scope: !110)
!112 = !DILocation(line: 77, column: 8, scope: !102)
!113 = !DILocation(line: 80, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 78, column: 5)
!115 = !DILocation(line: 80, column: 9, scope: !114)
!116 = !DILocation(line: 81, column: 9, scope: !114)
!117 = !DILocation(line: 81, column: 20, scope: !114)
!118 = !DILocation(line: 82, column: 5, scope: !114)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 84, type: !40)
!120 = distinct !DILexicalBlock(scope: !102, file: !12, line: 83, column: 5)
!121 = !DILocation(line: 84, column: 17, scope: !120)
!122 = !DILocation(line: 86, column: 16, scope: !120)
!123 = !DILocation(line: 86, column: 22, scope: !120)
!124 = !DILocation(line: 86, column: 9, scope: !120)
!125 = !DILocation(line: 87, column: 20, scope: !120)
!126 = !DILocation(line: 87, column: 9, scope: !120)
!127 = !DILocation(line: 89, column: 1, scope: !102)
