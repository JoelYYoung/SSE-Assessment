; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %4 = load i32*, i32** %data, align 8, !dbg !35
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51b_badSink(i32* %4), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51b_badSink(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #5, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #5, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !61 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !64
  %0 = bitcast i8* %call to i32*, !dbg !65
  store i32* %0, i32** %data, align 8, !dbg !66
  %1 = load i32*, i32** %data, align 8, !dbg !67
  %cmp = icmp eq i32* %1, null, !dbg !69
  br i1 %cmp, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !73
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #5, !dbg !74
  %3 = load i32*, i32** %data, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !75
  store i32 0, i32* %arrayidx, align 4, !dbg !76
  %4 = load i32*, i32** %data, align 8, !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51b_goodG2BSink(i32* %4), !dbg !78
  ret void, !dbg !79
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51b_goodG2BSink(i32*) #4

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51a.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51_bad", scope: !17, file: !17, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51a.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 34, type: !4)
!21 = !DILocation(line: 34, column: 15, scope: !16)
!22 = !DILocation(line: 35, column: 23, scope: !16)
!23 = !DILocation(line: 35, column: 12, scope: !16)
!24 = !DILocation(line: 35, column: 10, scope: !16)
!25 = !DILocation(line: 36, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 9)
!27 = !DILocation(line: 36, column: 14, scope: !26)
!28 = !DILocation(line: 36, column: 9, scope: !16)
!29 = !DILocation(line: 36, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 36, column: 23)
!31 = !DILocation(line: 38, column: 13, scope: !16)
!32 = !DILocation(line: 38, column: 5, scope: !16)
!33 = !DILocation(line: 39, column: 5, scope: !16)
!34 = !DILocation(line: 39, column: 17, scope: !16)
!35 = !DILocation(line: 40, column: 78, scope: !16)
!36 = !DILocation(line: 40, column: 5, scope: !16)
!37 = !DILocation(line: 41, column: 1, scope: !16)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_51_good", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 64, column: 5, scope: !38)
!40 = !DILocation(line: 65, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 77, type: !42, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!7, !7, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !17, line: 77, type: !7)
!48 = !DILocation(line: 77, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !17, line: 77, type: !44)
!50 = !DILocation(line: 77, column: 27, scope: !41)
!51 = !DILocation(line: 80, column: 22, scope: !41)
!52 = !DILocation(line: 80, column: 12, scope: !41)
!53 = !DILocation(line: 80, column: 5, scope: !41)
!54 = !DILocation(line: 82, column: 5, scope: !41)
!55 = !DILocation(line: 83, column: 5, scope: !41)
!56 = !DILocation(line: 84, column: 5, scope: !41)
!57 = !DILocation(line: 87, column: 5, scope: !41)
!58 = !DILocation(line: 88, column: 5, scope: !41)
!59 = !DILocation(line: 89, column: 5, scope: !41)
!60 = !DILocation(line: 91, column: 5, scope: !41)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", scope: !61, file: !17, line: 53, type: !4)
!63 = !DILocation(line: 53, column: 15, scope: !61)
!64 = !DILocation(line: 54, column: 23, scope: !61)
!65 = !DILocation(line: 54, column: 12, scope: !61)
!66 = !DILocation(line: 54, column: 10, scope: !61)
!67 = !DILocation(line: 55, column: 9, scope: !68)
!68 = distinct !DILexicalBlock(scope: !61, file: !17, line: 55, column: 9)
!69 = !DILocation(line: 55, column: 14, scope: !68)
!70 = !DILocation(line: 55, column: 9, scope: !61)
!71 = !DILocation(line: 55, column: 24, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !17, line: 55, column: 23)
!73 = !DILocation(line: 57, column: 13, scope: !61)
!74 = !DILocation(line: 57, column: 5, scope: !61)
!75 = !DILocation(line: 58, column: 5, scope: !61)
!76 = !DILocation(line: 58, column: 16, scope: !61)
!77 = !DILocation(line: 59, column: 82, scope: !61)
!78 = !DILocation(line: 59, column: 5, scope: !61)
!79 = !DILocation(line: 60, column: 1, scope: !61)
