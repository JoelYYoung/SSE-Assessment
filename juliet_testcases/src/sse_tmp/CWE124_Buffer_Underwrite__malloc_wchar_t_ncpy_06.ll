; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !37
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !50
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx3, align 4, !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !56
  store i32 0, i32* %arrayidx6, align 4, !dbg !57
  %7 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* %7), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #5, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #5, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !93
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !94
  %0 = bitcast i8* %call to i32*, !dbg !95
  store i32* %0, i32** %dataBuffer, align 8, !dbg !93
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq i32* %1, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !103
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  store i32* %4, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !112
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx3, align 4, !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !117
  %6 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !118
  store i32 0, i32* %arrayidx6, align 4, !dbg !119
  %7 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %7), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i32* null, i32** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !127, metadata !DIExpression()), !dbg !131
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !132
  %0 = bitcast i8* %call to i32*, !dbg !133
  store i32* %0, i32** %dataBuffer, align 8, !dbg !131
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  %cmp = icmp eq i32* %1, null, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !140
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !141
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !142
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !142
  store i32 0, i32* %arrayidx, align 4, !dbg !143
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !144
  store i32* %4, i32** %data, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !146, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !149
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !150
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx3, align 4, !dbg !152
  %5 = load i32*, i32** %data, align 8, !dbg !153
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !154
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !155
  %6 = load i32*, i32** %data, align 8, !dbg !156
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !156
  store i32 0, i32* %arrayidx6, align 4, !dbg !157
  %7 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* %7), !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06_bad", scope: !17, file: !17, line: 27, type: !18, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 29, type: !4)
!21 = !DILocation(line: 29, column: 15, scope: !16)
!22 = !DILocation(line: 30, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 34, type: !4)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 33, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !17, line: 32, column: 5)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 8)
!27 = !DILocation(line: 34, column: 23, scope: !24)
!28 = !DILocation(line: 34, column: 47, scope: !24)
!29 = !DILocation(line: 34, column: 36, scope: !24)
!30 = !DILocation(line: 35, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !17, line: 35, column: 17)
!32 = !DILocation(line: 35, column: 28, scope: !31)
!33 = !DILocation(line: 35, column: 17, scope: !24)
!34 = !DILocation(line: 35, column: 38, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 35, column: 37)
!36 = !DILocation(line: 36, column: 21, scope: !24)
!37 = !DILocation(line: 36, column: 13, scope: !24)
!38 = !DILocation(line: 37, column: 13, scope: !24)
!39 = !DILocation(line: 37, column: 31, scope: !24)
!40 = !DILocation(line: 39, column: 20, scope: !24)
!41 = !DILocation(line: 39, column: 31, scope: !24)
!42 = !DILocation(line: 39, column: 18, scope: !24)
!43 = !DILocalVariable(name: "source", scope: !44, file: !17, line: 43, type: !45)
!44 = distinct !DILexicalBlock(scope: !16, file: !17, line: 42, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 43, column: 17, scope: !44)
!49 = !DILocation(line: 44, column: 17, scope: !44)
!50 = !DILocation(line: 44, column: 9, scope: !44)
!51 = !DILocation(line: 45, column: 9, scope: !44)
!52 = !DILocation(line: 45, column: 23, scope: !44)
!53 = !DILocation(line: 47, column: 17, scope: !44)
!54 = !DILocation(line: 47, column: 23, scope: !44)
!55 = !DILocation(line: 47, column: 9, scope: !44)
!56 = !DILocation(line: 49, column: 9, scope: !44)
!57 = !DILocation(line: 49, column: 21, scope: !44)
!58 = !DILocation(line: 50, column: 20, scope: !44)
!59 = !DILocation(line: 50, column: 9, scope: !44)
!60 = !DILocation(line: 54, column: 1, scope: !16)
!61 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_06_good", scope: !17, file: !17, line: 125, type: !18, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 127, column: 5, scope: !61)
!63 = !DILocation(line: 128, column: 5, scope: !61)
!64 = !DILocation(line: 129, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 141, type: !66, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!7, !7, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !17, line: 141, type: !7)
!72 = !DILocation(line: 141, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !17, line: 141, type: !68)
!74 = !DILocation(line: 141, column: 27, scope: !65)
!75 = !DILocation(line: 144, column: 22, scope: !65)
!76 = !DILocation(line: 144, column: 12, scope: !65)
!77 = !DILocation(line: 144, column: 5, scope: !65)
!78 = !DILocation(line: 146, column: 5, scope: !65)
!79 = !DILocation(line: 147, column: 5, scope: !65)
!80 = !DILocation(line: 148, column: 5, scope: !65)
!81 = !DILocation(line: 151, column: 5, scope: !65)
!82 = !DILocation(line: 152, column: 5, scope: !65)
!83 = !DILocation(line: 153, column: 5, scope: !65)
!84 = !DILocation(line: 155, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !17, line: 63, type: !4)
!87 = !DILocation(line: 63, column: 15, scope: !85)
!88 = !DILocation(line: 64, column: 10, scope: !85)
!89 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !17, line: 73, type: !4)
!90 = distinct !DILexicalBlock(scope: !91, file: !17, line: 72, column: 9)
!91 = distinct !DILexicalBlock(scope: !92, file: !17, line: 71, column: 5)
!92 = distinct !DILexicalBlock(scope: !85, file: !17, line: 65, column: 8)
!93 = !DILocation(line: 73, column: 23, scope: !90)
!94 = !DILocation(line: 73, column: 47, scope: !90)
!95 = !DILocation(line: 73, column: 36, scope: !90)
!96 = !DILocation(line: 74, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !17, line: 74, column: 17)
!98 = !DILocation(line: 74, column: 28, scope: !97)
!99 = !DILocation(line: 74, column: 17, scope: !90)
!100 = !DILocation(line: 74, column: 38, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !17, line: 74, column: 37)
!102 = !DILocation(line: 75, column: 21, scope: !90)
!103 = !DILocation(line: 75, column: 13, scope: !90)
!104 = !DILocation(line: 76, column: 13, scope: !90)
!105 = !DILocation(line: 76, column: 31, scope: !90)
!106 = !DILocation(line: 78, column: 20, scope: !90)
!107 = !DILocation(line: 78, column: 18, scope: !90)
!108 = !DILocalVariable(name: "source", scope: !109, file: !17, line: 82, type: !45)
!109 = distinct !DILexicalBlock(scope: !85, file: !17, line: 81, column: 5)
!110 = !DILocation(line: 82, column: 17, scope: !109)
!111 = !DILocation(line: 83, column: 17, scope: !109)
!112 = !DILocation(line: 83, column: 9, scope: !109)
!113 = !DILocation(line: 84, column: 9, scope: !109)
!114 = !DILocation(line: 84, column: 23, scope: !109)
!115 = !DILocation(line: 86, column: 17, scope: !109)
!116 = !DILocation(line: 86, column: 23, scope: !109)
!117 = !DILocation(line: 86, column: 9, scope: !109)
!118 = !DILocation(line: 88, column: 9, scope: !109)
!119 = !DILocation(line: 88, column: 21, scope: !109)
!120 = !DILocation(line: 89, column: 20, scope: !109)
!121 = !DILocation(line: 89, column: 9, scope: !109)
!122 = !DILocation(line: 93, column: 1, scope: !85)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 96, type: !18, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !17, line: 98, type: !4)
!125 = !DILocation(line: 98, column: 15, scope: !123)
!126 = !DILocation(line: 99, column: 10, scope: !123)
!127 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !17, line: 103, type: !4)
!128 = distinct !DILexicalBlock(scope: !129, file: !17, line: 102, column: 9)
!129 = distinct !DILexicalBlock(scope: !130, file: !17, line: 101, column: 5)
!130 = distinct !DILexicalBlock(scope: !123, file: !17, line: 100, column: 8)
!131 = !DILocation(line: 103, column: 23, scope: !128)
!132 = !DILocation(line: 103, column: 47, scope: !128)
!133 = !DILocation(line: 103, column: 36, scope: !128)
!134 = !DILocation(line: 104, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !128, file: !17, line: 104, column: 17)
!136 = !DILocation(line: 104, column: 28, scope: !135)
!137 = !DILocation(line: 104, column: 17, scope: !128)
!138 = !DILocation(line: 104, column: 38, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !17, line: 104, column: 37)
!140 = !DILocation(line: 105, column: 21, scope: !128)
!141 = !DILocation(line: 105, column: 13, scope: !128)
!142 = !DILocation(line: 106, column: 13, scope: !128)
!143 = !DILocation(line: 106, column: 31, scope: !128)
!144 = !DILocation(line: 108, column: 20, scope: !128)
!145 = !DILocation(line: 108, column: 18, scope: !128)
!146 = !DILocalVariable(name: "source", scope: !147, file: !17, line: 112, type: !45)
!147 = distinct !DILexicalBlock(scope: !123, file: !17, line: 111, column: 5)
!148 = !DILocation(line: 112, column: 17, scope: !147)
!149 = !DILocation(line: 113, column: 17, scope: !147)
!150 = !DILocation(line: 113, column: 9, scope: !147)
!151 = !DILocation(line: 114, column: 9, scope: !147)
!152 = !DILocation(line: 114, column: 23, scope: !147)
!153 = !DILocation(line: 116, column: 17, scope: !147)
!154 = !DILocation(line: 116, column: 23, scope: !147)
!155 = !DILocation(line: 116, column: 9, scope: !147)
!156 = !DILocation(line: 118, column: 9, scope: !147)
!157 = !DILocation(line: 118, column: 21, scope: !147)
!158 = !DILocation(line: 119, column: 20, scope: !147)
!159 = !DILocation(line: 119, column: 9, scope: !147)
!160 = !DILocation(line: 123, column: 1, scope: !123)
