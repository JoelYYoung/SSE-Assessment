; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !53
  %6 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !54
  store i32 0, i32* %arrayidx6, align 4, !dbg !55
  %7 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %7), !dbg !57
  ret void, !dbg !58
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
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !89
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !90
  %0 = bitcast i8* %call to i32*, !dbg !91
  store i32* %0, i32** %dataBuffer, align 8, !dbg !89
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !99
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  store i32* %4, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !108
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx3, align 4, !dbg !110
  %5 = load i32*, i32** %data, align 8, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !114
  store i32 0, i32* %arrayidx6, align 4, !dbg !115
  %7 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* %7), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i32* null, i32** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !123, metadata !DIExpression()), !dbg !125
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !126
  %0 = bitcast i8* %call to i32*, !dbg !127
  store i32* %0, i32** %dataBuffer, align 8, !dbg !125
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  %cmp = icmp eq i32* %1, null, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !135
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  store i32* %4, i32** %data, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !143
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !144
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx3, align 4, !dbg !146
  %5 = load i32*, i32** %data, align 8, !dbg !147
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !148
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #5, !dbg !149
  %6 = load i32*, i32** %data, align 8, !dbg !150
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !150
  store i32 0, i32* %arrayidx6, align 4, !dbg !151
  %7 = load i32*, i32** %data, align 8, !dbg !152
  call void @printWLine(i32* %7), !dbg !153
  ret void, !dbg !154
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 31, type: !4)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!25 = !DILocation(line: 31, column: 19, scope: !24)
!26 = !DILocation(line: 31, column: 43, scope: !24)
!27 = !DILocation(line: 31, column: 32, scope: !24)
!28 = !DILocation(line: 32, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 32, column: 13)
!30 = !DILocation(line: 32, column: 24, scope: !29)
!31 = !DILocation(line: 32, column: 13, scope: !24)
!32 = !DILocation(line: 32, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 32, column: 33)
!34 = !DILocation(line: 33, column: 17, scope: !24)
!35 = !DILocation(line: 33, column: 9, scope: !24)
!36 = !DILocation(line: 34, column: 9, scope: !24)
!37 = !DILocation(line: 34, column: 27, scope: !24)
!38 = !DILocation(line: 36, column: 16, scope: !24)
!39 = !DILocation(line: 36, column: 27, scope: !24)
!40 = !DILocation(line: 36, column: 14, scope: !24)
!41 = !DILocalVariable(name: "source", scope: !42, file: !17, line: 45, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 45, column: 17, scope: !42)
!47 = !DILocation(line: 46, column: 17, scope: !42)
!48 = !DILocation(line: 46, column: 9, scope: !42)
!49 = !DILocation(line: 47, column: 9, scope: !42)
!50 = !DILocation(line: 47, column: 23, scope: !42)
!51 = !DILocation(line: 49, column: 17, scope: !42)
!52 = !DILocation(line: 49, column: 23, scope: !42)
!53 = !DILocation(line: 49, column: 9, scope: !42)
!54 = !DILocation(line: 51, column: 9, scope: !42)
!55 = !DILocation(line: 51, column: 21, scope: !42)
!56 = !DILocation(line: 52, column: 20, scope: !42)
!57 = !DILocation(line: 52, column: 9, scope: !42)
!58 = !DILocation(line: 56, column: 1, scope: !16)
!59 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_15_good", scope: !17, file: !17, line: 134, type: !18, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 136, column: 5, scope: !59)
!61 = !DILocation(line: 137, column: 5, scope: !59)
!62 = !DILocation(line: 138, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 150, type: !64, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 150, type: !7)
!70 = !DILocation(line: 150, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 150, type: !66)
!72 = !DILocation(line: 150, column: 27, scope: !63)
!73 = !DILocation(line: 153, column: 22, scope: !63)
!74 = !DILocation(line: 153, column: 12, scope: !63)
!75 = !DILocation(line: 153, column: 5, scope: !63)
!76 = !DILocation(line: 155, column: 5, scope: !63)
!77 = !DILocation(line: 156, column: 5, scope: !63)
!78 = !DILocation(line: 157, column: 5, scope: !63)
!79 = !DILocation(line: 160, column: 5, scope: !63)
!80 = !DILocation(line: 161, column: 5, scope: !63)
!81 = !DILocation(line: 162, column: 5, scope: !63)
!82 = !DILocation(line: 164, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !17, line: 65, type: !4)
!85 = !DILocation(line: 65, column: 15, scope: !83)
!86 = !DILocation(line: 66, column: 10, scope: !83)
!87 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !17, line: 75, type: !4)
!88 = distinct !DILexicalBlock(scope: !83, file: !17, line: 74, column: 5)
!89 = !DILocation(line: 75, column: 19, scope: !88)
!90 = !DILocation(line: 75, column: 43, scope: !88)
!91 = !DILocation(line: 75, column: 32, scope: !88)
!92 = !DILocation(line: 76, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !17, line: 76, column: 13)
!94 = !DILocation(line: 76, column: 24, scope: !93)
!95 = !DILocation(line: 76, column: 13, scope: !88)
!96 = !DILocation(line: 76, column: 34, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 76, column: 33)
!98 = !DILocation(line: 77, column: 17, scope: !88)
!99 = !DILocation(line: 77, column: 9, scope: !88)
!100 = !DILocation(line: 78, column: 9, scope: !88)
!101 = !DILocation(line: 78, column: 27, scope: !88)
!102 = !DILocation(line: 80, column: 16, scope: !88)
!103 = !DILocation(line: 80, column: 14, scope: !88)
!104 = !DILocalVariable(name: "source", scope: !105, file: !17, line: 85, type: !43)
!105 = distinct !DILexicalBlock(scope: !83, file: !17, line: 84, column: 5)
!106 = !DILocation(line: 85, column: 17, scope: !105)
!107 = !DILocation(line: 86, column: 17, scope: !105)
!108 = !DILocation(line: 86, column: 9, scope: !105)
!109 = !DILocation(line: 87, column: 9, scope: !105)
!110 = !DILocation(line: 87, column: 23, scope: !105)
!111 = !DILocation(line: 89, column: 17, scope: !105)
!112 = !DILocation(line: 89, column: 23, scope: !105)
!113 = !DILocation(line: 89, column: 9, scope: !105)
!114 = !DILocation(line: 91, column: 9, scope: !105)
!115 = !DILocation(line: 91, column: 21, scope: !105)
!116 = !DILocation(line: 92, column: 20, scope: !105)
!117 = !DILocation(line: 92, column: 9, scope: !105)
!118 = !DILocation(line: 96, column: 1, scope: !83)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 99, type: !18, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !17, line: 101, type: !4)
!121 = !DILocation(line: 101, column: 15, scope: !119)
!122 = !DILocation(line: 102, column: 10, scope: !119)
!123 = !DILocalVariable(name: "dataBuffer", scope: !124, file: !17, line: 107, type: !4)
!124 = distinct !DILexicalBlock(scope: !119, file: !17, line: 106, column: 5)
!125 = !DILocation(line: 107, column: 19, scope: !124)
!126 = !DILocation(line: 107, column: 43, scope: !124)
!127 = !DILocation(line: 107, column: 32, scope: !124)
!128 = !DILocation(line: 108, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !17, line: 108, column: 13)
!130 = !DILocation(line: 108, column: 24, scope: !129)
!131 = !DILocation(line: 108, column: 13, scope: !124)
!132 = !DILocation(line: 108, column: 34, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !17, line: 108, column: 33)
!134 = !DILocation(line: 109, column: 17, scope: !124)
!135 = !DILocation(line: 109, column: 9, scope: !124)
!136 = !DILocation(line: 110, column: 9, scope: !124)
!137 = !DILocation(line: 110, column: 27, scope: !124)
!138 = !DILocation(line: 112, column: 16, scope: !124)
!139 = !DILocation(line: 112, column: 14, scope: !124)
!140 = !DILocalVariable(name: "source", scope: !141, file: !17, line: 121, type: !43)
!141 = distinct !DILexicalBlock(scope: !119, file: !17, line: 120, column: 5)
!142 = !DILocation(line: 121, column: 17, scope: !141)
!143 = !DILocation(line: 122, column: 17, scope: !141)
!144 = !DILocation(line: 122, column: 9, scope: !141)
!145 = !DILocation(line: 123, column: 9, scope: !141)
!146 = !DILocation(line: 123, column: 23, scope: !141)
!147 = !DILocation(line: 125, column: 17, scope: !141)
!148 = !DILocation(line: 125, column: 23, scope: !141)
!149 = !DILocation(line: 125, column: 9, scope: !141)
!150 = !DILocation(line: 127, column: 9, scope: !141)
!151 = !DILocation(line: 127, column: 21, scope: !141)
!152 = !DILocation(line: 128, column: 20, scope: !141)
!153 = !DILocation(line: 128, column: 9, scope: !141)
!154 = !DILocation(line: 132, column: 1, scope: !119)
