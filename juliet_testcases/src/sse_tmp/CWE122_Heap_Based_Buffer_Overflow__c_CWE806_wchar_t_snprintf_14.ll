; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !31
  %cmp1 = icmp eq i32 %2, 5, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !34

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end4, !dbg !40

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !49
  %7 = load i32*, i32** %data, align 8, !dbg !50
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #7, !dbg !51
  %8 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %8), !dbg !53
  %9 = load i32*, i32** %data, align 8, !dbg !54
  %10 = bitcast i32* %9 to i8*, !dbg !54
  call void @free(i8* %10) #7, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !84
  %0 = bitcast i8* %call to i32*, !dbg !85
  store i32* %0, i32** %data, align 8, !dbg !86
  %1 = load i32*, i32** %data, align 8, !dbg !87
  %cmp = icmp eq i32* %1, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !93
  %cmp1 = icmp ne i32 %2, 5, !dbg !95
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !96

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !97
  br label %if.end4, !dbg !99

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !100
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !102
  %4 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !108
  %6 = load i32*, i32** %data, align 8, !dbg !109
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !110
  %7 = load i32*, i32** %data, align 8, !dbg !111
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #7, !dbg !112
  %8 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %8), !dbg !114
  %9 = load i32*, i32** %data, align 8, !dbg !115
  %10 = bitcast i32* %9 to i8*, !dbg !115
  call void @free(i8* %10) #7, !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !121
  %0 = bitcast i8* %call to i32*, !dbg !122
  store i32* %0, i32** %data, align 8, !dbg !123
  %1 = load i32*, i32** %data, align 8, !dbg !124
  %cmp = icmp eq i32* %1, null, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !130
  %cmp1 = icmp eq i32 %2, 5, !dbg !132
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !133

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !134
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !136
  %4 = load i32*, i32** %data, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  br label %if.end4, !dbg !139

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !140, metadata !DIExpression()), !dbg !142
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !142
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !143
  %6 = load i32*, i32** %data, align 8, !dbg !144
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !145
  %7 = load i32*, i32** %data, align 8, !dbg !146
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #7, !dbg !147
  %8 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* %8), !dbg !149
  %9 = load i32*, i32** %data, align 8, !dbg !150
  %10 = bitcast i32* %9 to i8*, !dbg !150
  call void @free(i8* %10) #7, !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocation(line: 32, column: 23, scope: !16)
!23 = !DILocation(line: 32, column: 12, scope: !16)
!24 = !DILocation(line: 32, column: 10, scope: !16)
!25 = !DILocation(line: 33, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 9)
!27 = !DILocation(line: 33, column: 14, scope: !26)
!28 = !DILocation(line: 33, column: 9, scope: !16)
!29 = !DILocation(line: 33, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 33, column: 23)
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 18, scope: !32)
!34 = !DILocation(line: 34, column: 8, scope: !16)
!35 = !DILocation(line: 37, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 35, column: 5)
!37 = !DILocation(line: 37, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 21, scope: !36)
!40 = !DILocation(line: 39, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !17, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocation(line: 43, column: 18, scope: !42)
!48 = !DILocation(line: 43, column: 31, scope: !42)
!49 = !DILocation(line: 43, column: 24, scope: !42)
!50 = !DILocation(line: 43, column: 45, scope: !42)
!51 = !DILocation(line: 43, column: 9, scope: !42)
!52 = !DILocation(line: 44, column: 20, scope: !42)
!53 = !DILocation(line: 44, column: 9, scope: !42)
!54 = !DILocation(line: 45, column: 14, scope: !42)
!55 = !DILocation(line: 45, column: 9, scope: !42)
!56 = !DILocation(line: 47, column: 1, scope: !16)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_14_good", scope: !17, file: !17, line: 100, type: !18, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 102, column: 5, scope: !57)
!59 = !DILocation(line: 103, column: 5, scope: !57)
!60 = !DILocation(line: 104, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 116, type: !62, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !17, line: 116, type: !7)
!68 = !DILocation(line: 116, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !17, line: 116, type: !64)
!70 = !DILocation(line: 116, column: 27, scope: !61)
!71 = !DILocation(line: 119, column: 22, scope: !61)
!72 = !DILocation(line: 119, column: 12, scope: !61)
!73 = !DILocation(line: 119, column: 5, scope: !61)
!74 = !DILocation(line: 121, column: 5, scope: !61)
!75 = !DILocation(line: 122, column: 5, scope: !61)
!76 = !DILocation(line: 123, column: 5, scope: !61)
!77 = !DILocation(line: 126, column: 5, scope: !61)
!78 = !DILocation(line: 127, column: 5, scope: !61)
!79 = !DILocation(line: 128, column: 5, scope: !61)
!80 = !DILocation(line: 130, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !17, line: 56, type: !4)
!83 = !DILocation(line: 56, column: 15, scope: !81)
!84 = !DILocation(line: 57, column: 23, scope: !81)
!85 = !DILocation(line: 57, column: 12, scope: !81)
!86 = !DILocation(line: 57, column: 10, scope: !81)
!87 = !DILocation(line: 58, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !17, line: 58, column: 9)
!89 = !DILocation(line: 58, column: 14, scope: !88)
!90 = !DILocation(line: 58, column: 9, scope: !81)
!91 = !DILocation(line: 58, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !17, line: 58, column: 23)
!93 = !DILocation(line: 59, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !81, file: !17, line: 59, column: 8)
!95 = !DILocation(line: 59, column: 18, scope: !94)
!96 = !DILocation(line: 59, column: 8, scope: !81)
!97 = !DILocation(line: 62, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !17, line: 60, column: 5)
!99 = !DILocation(line: 63, column: 5, scope: !98)
!100 = !DILocation(line: 67, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !17, line: 65, column: 5)
!102 = !DILocation(line: 67, column: 9, scope: !101)
!103 = !DILocation(line: 68, column: 9, scope: !101)
!104 = !DILocation(line: 68, column: 20, scope: !101)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !17, line: 71, type: !43)
!106 = distinct !DILexicalBlock(scope: !81, file: !17, line: 70, column: 5)
!107 = !DILocation(line: 71, column: 17, scope: !106)
!108 = !DILocation(line: 73, column: 18, scope: !106)
!109 = !DILocation(line: 73, column: 31, scope: !106)
!110 = !DILocation(line: 73, column: 24, scope: !106)
!111 = !DILocation(line: 73, column: 45, scope: !106)
!112 = !DILocation(line: 73, column: 9, scope: !106)
!113 = !DILocation(line: 74, column: 20, scope: !106)
!114 = !DILocation(line: 74, column: 9, scope: !106)
!115 = !DILocation(line: 75, column: 14, scope: !106)
!116 = !DILocation(line: 75, column: 9, scope: !106)
!117 = !DILocation(line: 77, column: 1, scope: !81)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !17, line: 82, type: !4)
!120 = !DILocation(line: 82, column: 15, scope: !118)
!121 = !DILocation(line: 83, column: 23, scope: !118)
!122 = !DILocation(line: 83, column: 12, scope: !118)
!123 = !DILocation(line: 83, column: 10, scope: !118)
!124 = !DILocation(line: 84, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !17, line: 84, column: 9)
!126 = !DILocation(line: 84, column: 14, scope: !125)
!127 = !DILocation(line: 84, column: 9, scope: !118)
!128 = !DILocation(line: 84, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 84, column: 23)
!130 = !DILocation(line: 85, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !118, file: !17, line: 85, column: 8)
!132 = !DILocation(line: 85, column: 18, scope: !131)
!133 = !DILocation(line: 85, column: 8, scope: !118)
!134 = !DILocation(line: 88, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !17, line: 86, column: 5)
!136 = !DILocation(line: 88, column: 9, scope: !135)
!137 = !DILocation(line: 89, column: 9, scope: !135)
!138 = !DILocation(line: 89, column: 20, scope: !135)
!139 = !DILocation(line: 90, column: 5, scope: !135)
!140 = !DILocalVariable(name: "dest", scope: !141, file: !17, line: 92, type: !43)
!141 = distinct !DILexicalBlock(scope: !118, file: !17, line: 91, column: 5)
!142 = !DILocation(line: 92, column: 17, scope: !141)
!143 = !DILocation(line: 94, column: 18, scope: !141)
!144 = !DILocation(line: 94, column: 31, scope: !141)
!145 = !DILocation(line: 94, column: 24, scope: !141)
!146 = !DILocation(line: 94, column: 45, scope: !141)
!147 = !DILocation(line: 94, column: 9, scope: !141)
!148 = !DILocation(line: 95, column: 20, scope: !141)
!149 = !DILocation(line: 95, column: 9, scope: !141)
!150 = !DILocation(line: 96, column: 14, scope: !141)
!151 = !DILocation(line: 96, column: 9, scope: !141)
!152 = !DILocation(line: 98, column: 1, scope: !118)
