; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %3 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !39
  %4 = load i32*, i32** %data, align 8, !dbg !40
  call void %3(i32* %4), !dbg !39
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !52
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  %0 = load i32*, i32** %data.addr, align 8, !dbg !55
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %0, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.4, i64 0, i64 0), i32* %arraydecay1) #5, !dbg !57
  %1 = load i32*, i32** %data.addr, align 8, !dbg !58
  call void @printWLine(i32* %1), !dbg !59
  %2 = load i32*, i32** %data.addr, align 8, !dbg !60
  %3 = bitcast i32* %2 to i8*, !dbg !60
  call void @free(i8* %3) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !89, metadata !DIExpression()), !dbg !90
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !92
  %0 = bitcast i8* %call to i32*, !dbg !93
  store i32* %0, i32** %data, align 8, !dbg !94
  %1 = load i32*, i32** %data, align 8, !dbg !95
  %cmp = icmp eq i32* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %3 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !103
  %4 = load i32*, i32** %data, align 8, !dbg !104
  call void %3(i32* %4), !dbg !103
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !106 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !113
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %0 = load i32*, i32** %data.addr, align 8, !dbg !116
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %0, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.4, i64 0, i64 0), i32* %arraydecay1) #5, !dbg !118
  %1 = load i32*, i32** %data.addr, align 8, !dbg !119
  call void @printWLine(i32* %1), !dbg !120
  %2 = load i32*, i32** %data.addr, align 8, !dbg !121
  %3 = bitcast i32* %2 to i8*, !dbg !121
  call void @free(i8* %3) #5, !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44_bad", scope: !17, file: !17, line: 42, type: !18, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 44, type: !4)
!21 = !DILocation(line: 44, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 46, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 46, column: 12, scope: !16)
!27 = !DILocation(line: 47, column: 10, scope: !16)
!28 = !DILocation(line: 49, column: 23, scope: !16)
!29 = !DILocation(line: 49, column: 12, scope: !16)
!30 = !DILocation(line: 49, column: 10, scope: !16)
!31 = !DILocation(line: 50, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 50, column: 9)
!33 = !DILocation(line: 50, column: 14, scope: !32)
!34 = !DILocation(line: 50, column: 9, scope: !16)
!35 = !DILocation(line: 50, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 50, column: 23)
!37 = !DILocation(line: 51, column: 5, scope: !16)
!38 = !DILocation(line: 51, column: 13, scope: !16)
!39 = !DILocation(line: 53, column: 5, scope: !16)
!40 = !DILocation(line: 53, column: 13, scope: !16)
!41 = !DILocation(line: 54, column: 1, scope: !16)
!42 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 29, type: !24, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !17, line: 29, type: !4)
!44 = !DILocation(line: 29, column: 31, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !17, line: 32, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !17, line: 31, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 32, column: 17, scope: !46)
!51 = !DILocation(line: 33, column: 17, scope: !46)
!52 = !DILocation(line: 33, column: 9, scope: !46)
!53 = !DILocation(line: 34, column: 9, scope: !46)
!54 = !DILocation(line: 34, column: 23, scope: !46)
!55 = !DILocation(line: 36, column: 18, scope: !46)
!56 = !DILocation(line: 36, column: 36, scope: !46)
!57 = !DILocation(line: 36, column: 9, scope: !46)
!58 = !DILocation(line: 37, column: 20, scope: !46)
!59 = !DILocation(line: 37, column: 9, scope: !46)
!60 = !DILocation(line: 38, column: 14, scope: !46)
!61 = !DILocation(line: 38, column: 9, scope: !46)
!62 = !DILocation(line: 40, column: 1, scope: !42)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_44_good", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 88, column: 5, scope: !63)
!65 = !DILocation(line: 89, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 100, type: !67, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!7, !7, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !17, line: 100, type: !7)
!73 = !DILocation(line: 100, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !17, line: 100, type: !69)
!75 = !DILocation(line: 100, column: 27, scope: !66)
!76 = !DILocation(line: 103, column: 22, scope: !66)
!77 = !DILocation(line: 103, column: 12, scope: !66)
!78 = !DILocation(line: 103, column: 5, scope: !66)
!79 = !DILocation(line: 105, column: 5, scope: !66)
!80 = !DILocation(line: 106, column: 5, scope: !66)
!81 = !DILocation(line: 107, column: 5, scope: !66)
!82 = !DILocation(line: 110, column: 5, scope: !66)
!83 = !DILocation(line: 111, column: 5, scope: !66)
!84 = !DILocation(line: 112, column: 5, scope: !66)
!85 = !DILocation(line: 114, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 74, type: !18, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !17, line: 76, type: !4)
!88 = !DILocation(line: 76, column: 15, scope: !86)
!89 = !DILocalVariable(name: "funcPtr", scope: !86, file: !17, line: 77, type: !23)
!90 = !DILocation(line: 77, column: 12, scope: !86)
!91 = !DILocation(line: 78, column: 10, scope: !86)
!92 = !DILocation(line: 80, column: 23, scope: !86)
!93 = !DILocation(line: 80, column: 12, scope: !86)
!94 = !DILocation(line: 80, column: 10, scope: !86)
!95 = !DILocation(line: 81, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !86, file: !17, line: 81, column: 9)
!97 = !DILocation(line: 81, column: 14, scope: !96)
!98 = !DILocation(line: 81, column: 9, scope: !86)
!99 = !DILocation(line: 81, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !17, line: 81, column: 23)
!101 = !DILocation(line: 82, column: 5, scope: !86)
!102 = !DILocation(line: 82, column: 13, scope: !86)
!103 = !DILocation(line: 83, column: 5, scope: !86)
!104 = !DILocation(line: 83, column: 13, scope: !86)
!105 = !DILocation(line: 84, column: 1, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 61, type: !24, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", arg: 1, scope: !106, file: !17, line: 61, type: !4)
!108 = !DILocation(line: 61, column: 35, scope: !106)
!109 = !DILocalVariable(name: "source", scope: !110, file: !17, line: 64, type: !47)
!110 = distinct !DILexicalBlock(scope: !106, file: !17, line: 63, column: 5)
!111 = !DILocation(line: 64, column: 17, scope: !110)
!112 = !DILocation(line: 65, column: 17, scope: !110)
!113 = !DILocation(line: 65, column: 9, scope: !110)
!114 = !DILocation(line: 66, column: 9, scope: !110)
!115 = !DILocation(line: 66, column: 23, scope: !110)
!116 = !DILocation(line: 68, column: 18, scope: !110)
!117 = !DILocation(line: 68, column: 36, scope: !110)
!118 = !DILocation(line: 68, column: 9, scope: !110)
!119 = !DILocation(line: 69, column: 20, scope: !110)
!120 = !DILocation(line: 69, column: 9, scope: !110)
!121 = !DILocation(line: 70, column: 14, scope: !110)
!122 = !DILocation(line: 70, column: 9, scope: !110)
!123 = !DILocation(line: 72, column: 1, scope: !106)
