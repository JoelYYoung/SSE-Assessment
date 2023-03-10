; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  call void %4(i32* %5), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65b_badSink(i32*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !69, metadata !DIExpression()), !dbg !70
  store void (i32*)* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !70
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !71
  %0 = bitcast i8* %call to i32*, !dbg !72
  store i32* %0, i32** %data, align 8, !dbg !73
  %1 = load i32*, i32** %data, align 8, !dbg !74
  %cmp = icmp eq i32* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !80
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #5, !dbg !81
  %3 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  %4 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !84
  %5 = load i32*, i32** %data, align 8, !dbg !85
  call void %4(i32* %5), !dbg !84
  ret void, !dbg !86
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65_bad", scope: !17, file: !17, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65a.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 34, type: !4)
!21 = !DILocation(line: 34, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 36, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 36, column: 12, scope: !16)
!27 = !DILocation(line: 37, column: 23, scope: !16)
!28 = !DILocation(line: 37, column: 12, scope: !16)
!29 = !DILocation(line: 37, column: 10, scope: !16)
!30 = !DILocation(line: 38, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 9)
!32 = !DILocation(line: 38, column: 14, scope: !31)
!33 = !DILocation(line: 38, column: 9, scope: !16)
!34 = !DILocation(line: 38, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 38, column: 23)
!36 = !DILocation(line: 40, column: 13, scope: !16)
!37 = !DILocation(line: 40, column: 5, scope: !16)
!38 = !DILocation(line: 41, column: 5, scope: !16)
!39 = !DILocation(line: 41, column: 17, scope: !16)
!40 = !DILocation(line: 43, column: 5, scope: !16)
!41 = !DILocation(line: 43, column: 13, scope: !16)
!42 = !DILocation(line: 44, column: 1, scope: !16)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_65_good", scope: !17, file: !17, line: 65, type: !18, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 67, column: 5, scope: !43)
!45 = !DILocation(line: 68, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 80, type: !47, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!7, !7, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !17, line: 80, type: !7)
!53 = !DILocation(line: 80, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !17, line: 80, type: !49)
!55 = !DILocation(line: 80, column: 27, scope: !46)
!56 = !DILocation(line: 83, column: 22, scope: !46)
!57 = !DILocation(line: 83, column: 12, scope: !46)
!58 = !DILocation(line: 83, column: 5, scope: !46)
!59 = !DILocation(line: 85, column: 5, scope: !46)
!60 = !DILocation(line: 86, column: 5, scope: !46)
!61 = !DILocation(line: 87, column: 5, scope: !46)
!62 = !DILocation(line: 90, column: 5, scope: !46)
!63 = !DILocation(line: 91, column: 5, scope: !46)
!64 = !DILocation(line: 92, column: 5, scope: !46)
!65 = !DILocation(line: 94, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !17, line: 55, type: !4)
!68 = !DILocation(line: 55, column: 15, scope: !66)
!69 = !DILocalVariable(name: "funcPtr", scope: !66, file: !17, line: 56, type: !23)
!70 = !DILocation(line: 56, column: 12, scope: !66)
!71 = !DILocation(line: 57, column: 23, scope: !66)
!72 = !DILocation(line: 57, column: 12, scope: !66)
!73 = !DILocation(line: 57, column: 10, scope: !66)
!74 = !DILocation(line: 58, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !66, file: !17, line: 58, column: 9)
!76 = !DILocation(line: 58, column: 14, scope: !75)
!77 = !DILocation(line: 58, column: 9, scope: !66)
!78 = !DILocation(line: 58, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !17, line: 58, column: 23)
!80 = !DILocation(line: 60, column: 13, scope: !66)
!81 = !DILocation(line: 60, column: 5, scope: !66)
!82 = !DILocation(line: 61, column: 5, scope: !66)
!83 = !DILocation(line: 61, column: 16, scope: !66)
!84 = !DILocation(line: 62, column: 5, scope: !66)
!85 = !DILocation(line: 62, column: 13, scope: !66)
!86 = !DILocation(line: 63, column: 1, scope: !66)
