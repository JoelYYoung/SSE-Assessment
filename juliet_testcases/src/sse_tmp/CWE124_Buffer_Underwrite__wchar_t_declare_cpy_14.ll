; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %0 = load i32, i32* @globalFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !34
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !36
  store i32* %add.ptr, i32** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !43
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx4, align 4, !dbg !45
  %1 = load i32*, i32** %data, align 8, !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call6 = call i32* @wcscpy(i32* %1, i32* %arraydecay5) #4, !dbg !48
  %2 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %2), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #4, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #4, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !81
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !82
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  %0 = load i32, i32* @globalFive, align 4, !dbg !85
  %cmp = icmp ne i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay1, i32** %data, align 8, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !98
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !99
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx4, align 4, !dbg !101
  %1 = load i32*, i32** %data, align 8, !dbg !102
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call6 = call i32* @wcscpy(i32* %1, i32* %arraydecay5) #4, !dbg !104
  %2 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %2), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !113
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !114
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %0 = load i32, i32* @globalFive, align 4, !dbg !117
  %cmp = icmp eq i32 %0, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !121
  store i32* %arraydecay1, i32** %data, align 8, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !128
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !129
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx4, align 4, !dbg !131
  %1 = load i32*, i32** %data, align 8, !dbg !132
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call6 = call i32* @wcscpy(i32* %1, i32* %arraydecay5) #4, !dbg !134
  %2 = load i32*, i32** %data, align 8, !dbg !135
  call void @printWLine(i32* %2), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 29, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!32 = !DILocation(line: 29, column: 18, scope: !31)
!33 = !DILocation(line: 29, column: 8, scope: !11)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 30, column: 5)
!36 = !DILocation(line: 32, column: 27, scope: !35)
!37 = !DILocation(line: 32, column: 14, scope: !35)
!38 = !DILocation(line: 33, column: 5, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 35, type: !22)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!41 = !DILocation(line: 35, column: 17, scope: !40)
!42 = !DILocation(line: 36, column: 17, scope: !40)
!43 = !DILocation(line: 36, column: 9, scope: !40)
!44 = !DILocation(line: 37, column: 9, scope: !40)
!45 = !DILocation(line: 37, column: 23, scope: !40)
!46 = !DILocation(line: 39, column: 16, scope: !40)
!47 = !DILocation(line: 39, column: 22, scope: !40)
!48 = !DILocation(line: 39, column: 9, scope: !40)
!49 = !DILocation(line: 40, column: 20, scope: !40)
!50 = !DILocation(line: 40, column: 9, scope: !40)
!51 = !DILocation(line: 42, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_cpy_14_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 99, column: 5, scope: !52)
!54 = !DILocation(line: 100, column: 5, scope: !52)
!55 = !DILocation(line: 101, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !57, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!19, !19, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 113, type: !19)
!63 = !DILocation(line: 113, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 113, type: !59)
!65 = !DILocation(line: 113, column: 27, scope: !56)
!66 = !DILocation(line: 116, column: 22, scope: !56)
!67 = !DILocation(line: 116, column: 12, scope: !56)
!68 = !DILocation(line: 116, column: 5, scope: !56)
!69 = !DILocation(line: 118, column: 5, scope: !56)
!70 = !DILocation(line: 119, column: 5, scope: !56)
!71 = !DILocation(line: 120, column: 5, scope: !56)
!72 = !DILocation(line: 123, column: 5, scope: !56)
!73 = !DILocation(line: 124, column: 5, scope: !56)
!74 = !DILocation(line: 125, column: 5, scope: !56)
!75 = !DILocation(line: 127, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 51, type: !16)
!78 = !DILocation(line: 51, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !12, line: 52, type: !22)
!80 = !DILocation(line: 52, column: 13, scope: !76)
!81 = !DILocation(line: 53, column: 13, scope: !76)
!82 = !DILocation(line: 53, column: 5, scope: !76)
!83 = !DILocation(line: 54, column: 5, scope: !76)
!84 = !DILocation(line: 54, column: 23, scope: !76)
!85 = !DILocation(line: 55, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !12, line: 55, column: 8)
!87 = !DILocation(line: 55, column: 18, scope: !86)
!88 = !DILocation(line: 55, column: 8, scope: !76)
!89 = !DILocation(line: 58, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !12, line: 56, column: 5)
!91 = !DILocation(line: 59, column: 5, scope: !90)
!92 = !DILocation(line: 63, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !12, line: 61, column: 5)
!94 = !DILocation(line: 63, column: 14, scope: !93)
!95 = !DILocalVariable(name: "source", scope: !96, file: !12, line: 66, type: !22)
!96 = distinct !DILexicalBlock(scope: !76, file: !12, line: 65, column: 5)
!97 = !DILocation(line: 66, column: 17, scope: !96)
!98 = !DILocation(line: 67, column: 17, scope: !96)
!99 = !DILocation(line: 67, column: 9, scope: !96)
!100 = !DILocation(line: 68, column: 9, scope: !96)
!101 = !DILocation(line: 68, column: 23, scope: !96)
!102 = !DILocation(line: 70, column: 16, scope: !96)
!103 = !DILocation(line: 70, column: 22, scope: !96)
!104 = !DILocation(line: 70, column: 9, scope: !96)
!105 = !DILocation(line: 71, column: 20, scope: !96)
!106 = !DILocation(line: 71, column: 9, scope: !96)
!107 = !DILocation(line: 73, column: 1, scope: !76)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 78, type: !16)
!110 = !DILocation(line: 78, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !12, line: 79, type: !22)
!112 = !DILocation(line: 79, column: 13, scope: !108)
!113 = !DILocation(line: 80, column: 13, scope: !108)
!114 = !DILocation(line: 80, column: 5, scope: !108)
!115 = !DILocation(line: 81, column: 5, scope: !108)
!116 = !DILocation(line: 81, column: 23, scope: !108)
!117 = !DILocation(line: 82, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !12, line: 82, column: 8)
!119 = !DILocation(line: 82, column: 18, scope: !118)
!120 = !DILocation(line: 82, column: 8, scope: !108)
!121 = !DILocation(line: 85, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 83, column: 5)
!123 = !DILocation(line: 85, column: 14, scope: !122)
!124 = !DILocation(line: 86, column: 5, scope: !122)
!125 = !DILocalVariable(name: "source", scope: !126, file: !12, line: 88, type: !22)
!126 = distinct !DILexicalBlock(scope: !108, file: !12, line: 87, column: 5)
!127 = !DILocation(line: 88, column: 17, scope: !126)
!128 = !DILocation(line: 89, column: 17, scope: !126)
!129 = !DILocation(line: 89, column: 9, scope: !126)
!130 = !DILocation(line: 90, column: 9, scope: !126)
!131 = !DILocation(line: 90, column: 23, scope: !126)
!132 = !DILocation(line: 92, column: 16, scope: !126)
!133 = !DILocation(line: 92, column: 22, scope: !126)
!134 = !DILocation(line: 92, column: 9, scope: !126)
!135 = !DILocation(line: 93, column: 20, scope: !126)
!136 = !DILocation(line: 93, column: 9, scope: !126)
!137 = !DILocation(line: 95, column: 1, scope: !108)
