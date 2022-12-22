; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %source, !dbg !23

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !24), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !43
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !48
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %3, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay4) #5, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %4), !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  %6 = bitcast i32* %5 to i8*, !dbg !52
  call void @free(i8* %6) #5, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i32* null, i32** %data, align 8, !dbg !81
  br label %source, !dbg !82

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !83), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !85
  %0 = bitcast i8* %call to i32*, !dbg !86
  store i32* %0, i32** %data, align 8, !dbg !87
  %1 = load i32*, i32** %data, align 8, !dbg !88
  %cmp = icmp eq i32* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !99
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !100
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx3, align 4, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !104
  %call5 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %3, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay4) #5, !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %4), !dbg !107
  %5 = load i32*, i32** %data, align 8, !dbg !108
  %6 = bitcast i32* %5 to i8*, !dbg !108
  call void @free(i8* %6) #5, !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocation(line: 32, column: 10, scope: !16)
!23 = !DILocation(line: 33, column: 5, scope: !16)
!24 = !DILabel(scope: !16, name: "source", file: !17, line: 34)
!25 = !DILocation(line: 34, column: 1, scope: !16)
!26 = !DILocation(line: 36, column: 23, scope: !16)
!27 = !DILocation(line: 36, column: 12, scope: !16)
!28 = !DILocation(line: 36, column: 10, scope: !16)
!29 = !DILocation(line: 37, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 9)
!31 = !DILocation(line: 37, column: 14, scope: !30)
!32 = !DILocation(line: 37, column: 9, scope: !16)
!33 = !DILocation(line: 37, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !17, line: 37, column: 23)
!35 = !DILocation(line: 38, column: 5, scope: !16)
!36 = !DILocation(line: 38, column: 13, scope: !16)
!37 = !DILocalVariable(name: "source", scope: !38, file: !17, line: 40, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 40, column: 17, scope: !38)
!43 = !DILocation(line: 41, column: 17, scope: !38)
!44 = !DILocation(line: 41, column: 9, scope: !38)
!45 = !DILocation(line: 42, column: 9, scope: !38)
!46 = !DILocation(line: 42, column: 23, scope: !38)
!47 = !DILocation(line: 44, column: 18, scope: !38)
!48 = !DILocation(line: 44, column: 36, scope: !38)
!49 = !DILocation(line: 44, column: 9, scope: !38)
!50 = !DILocation(line: 45, column: 20, scope: !38)
!51 = !DILocation(line: 45, column: 9, scope: !38)
!52 = !DILocation(line: 46, column: 14, scope: !38)
!53 = !DILocation(line: 46, column: 9, scope: !38)
!54 = !DILocation(line: 48, column: 1, scope: !16)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_18_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 78, column: 5, scope: !55)
!57 = !DILocation(line: 79, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 91, type: !59, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !17, line: 91, type: !7)
!65 = !DILocation(line: 91, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !17, line: 91, type: !61)
!67 = !DILocation(line: 91, column: 27, scope: !58)
!68 = !DILocation(line: 94, column: 22, scope: !58)
!69 = !DILocation(line: 94, column: 12, scope: !58)
!70 = !DILocation(line: 94, column: 5, scope: !58)
!71 = !DILocation(line: 96, column: 5, scope: !58)
!72 = !DILocation(line: 97, column: 5, scope: !58)
!73 = !DILocation(line: 98, column: 5, scope: !58)
!74 = !DILocation(line: 101, column: 5, scope: !58)
!75 = !DILocation(line: 102, column: 5, scope: !58)
!76 = !DILocation(line: 103, column: 5, scope: !58)
!77 = !DILocation(line: 105, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !17, line: 57, type: !4)
!80 = !DILocation(line: 57, column: 15, scope: !78)
!81 = !DILocation(line: 58, column: 10, scope: !78)
!82 = !DILocation(line: 59, column: 5, scope: !78)
!83 = !DILabel(scope: !78, name: "source", file: !17, line: 60)
!84 = !DILocation(line: 60, column: 1, scope: !78)
!85 = !DILocation(line: 62, column: 23, scope: !78)
!86 = !DILocation(line: 62, column: 12, scope: !78)
!87 = !DILocation(line: 62, column: 10, scope: !78)
!88 = !DILocation(line: 63, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !78, file: !17, line: 63, column: 9)
!90 = !DILocation(line: 63, column: 14, scope: !89)
!91 = !DILocation(line: 63, column: 9, scope: !78)
!92 = !DILocation(line: 63, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !17, line: 63, column: 23)
!94 = !DILocation(line: 64, column: 5, scope: !78)
!95 = !DILocation(line: 64, column: 13, scope: !78)
!96 = !DILocalVariable(name: "source", scope: !97, file: !17, line: 66, type: !39)
!97 = distinct !DILexicalBlock(scope: !78, file: !17, line: 65, column: 5)
!98 = !DILocation(line: 66, column: 17, scope: !97)
!99 = !DILocation(line: 67, column: 17, scope: !97)
!100 = !DILocation(line: 67, column: 9, scope: !97)
!101 = !DILocation(line: 68, column: 9, scope: !97)
!102 = !DILocation(line: 68, column: 23, scope: !97)
!103 = !DILocation(line: 70, column: 18, scope: !97)
!104 = !DILocation(line: 70, column: 36, scope: !97)
!105 = !DILocation(line: 70, column: 9, scope: !97)
!106 = !DILocation(line: 71, column: 20, scope: !97)
!107 = !DILocation(line: 71, column: 9, scope: !97)
!108 = !DILocation(line: 72, column: 14, scope: !97)
!109 = !DILocation(line: 72, column: 9, scope: !97)
!110 = !DILocation(line: 74, column: 1, scope: !78)
