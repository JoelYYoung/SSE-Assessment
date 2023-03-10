; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !22, metadata !DIExpression()), !dbg !26
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
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !40
  store i32* %3, i32** %arrayidx1, align 16, !dbg !41
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !42
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b_badSink(i32** %arraydecay), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b_badSink(i32**) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !74
  %0 = bitcast i8* %call to i32*, !dbg !75
  store i32* %0, i32** %data, align 8, !dbg !76
  %1 = load i32*, i32** %data, align 8, !dbg !77
  %cmp = icmp eq i32* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !86
  store i32* %3, i32** %arrayidx1, align 16, !dbg !87
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b_goodG2BSink(i32** %arraydecay), !dbg !89
  ret void, !dbg !90
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66b_goodG2BSink(i32**) #4

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66_bad", scope: !17, file: !17, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66a.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 34, type: !4)
!21 = !DILocation(line: 34, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataArray", scope: !16, file: !17, line: 35, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 5)
!26 = !DILocation(line: 35, column: 15, scope: !16)
!27 = !DILocation(line: 36, column: 10, scope: !16)
!28 = !DILocation(line: 38, column: 23, scope: !16)
!29 = !DILocation(line: 38, column: 12, scope: !16)
!30 = !DILocation(line: 38, column: 10, scope: !16)
!31 = !DILocation(line: 39, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 9)
!33 = !DILocation(line: 39, column: 14, scope: !32)
!34 = !DILocation(line: 39, column: 9, scope: !16)
!35 = !DILocation(line: 39, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 39, column: 23)
!37 = !DILocation(line: 40, column: 5, scope: !16)
!38 = !DILocation(line: 40, column: 13, scope: !16)
!39 = !DILocation(line: 42, column: 20, scope: !16)
!40 = !DILocation(line: 42, column: 5, scope: !16)
!41 = !DILocation(line: 42, column: 18, scope: !16)
!42 = !DILocation(line: 43, column: 78, scope: !16)
!43 = !DILocation(line: 43, column: 5, scope: !16)
!44 = !DILocation(line: 44, column: 1, scope: !16)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_snprintf_66_good", scope: !17, file: !17, line: 66, type: !18, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 68, column: 5, scope: !45)
!47 = !DILocation(line: 69, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 81, type: !49, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!7, !7, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !17, line: 81, type: !7)
!55 = !DILocation(line: 81, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !17, line: 81, type: !51)
!57 = !DILocation(line: 81, column: 27, scope: !48)
!58 = !DILocation(line: 84, column: 22, scope: !48)
!59 = !DILocation(line: 84, column: 12, scope: !48)
!60 = !DILocation(line: 84, column: 5, scope: !48)
!61 = !DILocation(line: 86, column: 5, scope: !48)
!62 = !DILocation(line: 87, column: 5, scope: !48)
!63 = !DILocation(line: 88, column: 5, scope: !48)
!64 = !DILocation(line: 91, column: 5, scope: !48)
!65 = !DILocation(line: 92, column: 5, scope: !48)
!66 = !DILocation(line: 93, column: 5, scope: !48)
!67 = !DILocation(line: 95, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !17, line: 55, type: !4)
!70 = !DILocation(line: 55, column: 15, scope: !68)
!71 = !DILocalVariable(name: "dataArray", scope: !68, file: !17, line: 56, type: !23)
!72 = !DILocation(line: 56, column: 15, scope: !68)
!73 = !DILocation(line: 57, column: 10, scope: !68)
!74 = !DILocation(line: 59, column: 23, scope: !68)
!75 = !DILocation(line: 59, column: 12, scope: !68)
!76 = !DILocation(line: 59, column: 10, scope: !68)
!77 = !DILocation(line: 60, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !68, file: !17, line: 60, column: 9)
!79 = !DILocation(line: 60, column: 14, scope: !78)
!80 = !DILocation(line: 60, column: 9, scope: !68)
!81 = !DILocation(line: 60, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !17, line: 60, column: 23)
!83 = !DILocation(line: 61, column: 5, scope: !68)
!84 = !DILocation(line: 61, column: 13, scope: !68)
!85 = !DILocation(line: 62, column: 20, scope: !68)
!86 = !DILocation(line: 62, column: 5, scope: !68)
!87 = !DILocation(line: 62, column: 18, scope: !68)
!88 = !DILocation(line: 63, column: 82, scope: !68)
!89 = !DILocation(line: 63, column: 5, scope: !68)
!90 = !DILocation(line: 64, column: 1, scope: !68)
