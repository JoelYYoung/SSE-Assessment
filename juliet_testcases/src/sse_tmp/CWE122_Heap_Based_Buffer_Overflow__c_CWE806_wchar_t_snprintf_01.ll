; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01_bad() #0 !dbg !16 {
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
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !44
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %7), !dbg !47
  %8 = load i32*, i32** %data, align 8, !dbg !48
  %9 = bitcast i32* %8 to i8*, !dbg !48
  call void @free(i8* %9) #7, !dbg !49
  ret void, !dbg !50
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
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
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !77
  %0 = bitcast i8* %call to i32*, !dbg !78
  store i32* %0, i32** %data, align 8, !dbg !79
  %1 = load i32*, i32** %data, align 8, !dbg !80
  %cmp = icmp eq i32* %1, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !86
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !87
  %3 = load i32*, i32** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !92
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !93
  %5 = load i32*, i32** %data, align 8, !dbg !94
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !95
  %6 = load i32*, i32** %data, align 8, !dbg !96
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !97
  %7 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* %7), !dbg !99
  %8 = load i32*, i32** %data, align 8, !dbg !100
  %9 = bitcast i32* %8 to i8*, !dbg !100
  call void @free(i8* %9) #7, !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 35, column: 13, scope: !16)
!32 = !DILocation(line: 35, column: 5, scope: !16)
!33 = !DILocation(line: 36, column: 5, scope: !16)
!34 = !DILocation(line: 36, column: 17, scope: !16)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !17, line: 38, type: !37)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 38, column: 17, scope: !36)
!41 = !DILocation(line: 40, column: 18, scope: !36)
!42 = !DILocation(line: 40, column: 31, scope: !36)
!43 = !DILocation(line: 40, column: 24, scope: !36)
!44 = !DILocation(line: 40, column: 45, scope: !36)
!45 = !DILocation(line: 40, column: 9, scope: !36)
!46 = !DILocation(line: 41, column: 20, scope: !36)
!47 = !DILocation(line: 41, column: 9, scope: !36)
!48 = !DILocation(line: 42, column: 14, scope: !36)
!49 = !DILocation(line: 42, column: 9, scope: !36)
!50 = !DILocation(line: 44, column: 1, scope: !16)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_01_good", scope: !17, file: !17, line: 68, type: !18, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 70, column: 5, scope: !51)
!53 = !DILocation(line: 71, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 83, type: !55, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !17, line: 83, type: !7)
!61 = !DILocation(line: 83, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !17, line: 83, type: !57)
!63 = !DILocation(line: 83, column: 27, scope: !54)
!64 = !DILocation(line: 86, column: 22, scope: !54)
!65 = !DILocation(line: 86, column: 12, scope: !54)
!66 = !DILocation(line: 86, column: 5, scope: !54)
!67 = !DILocation(line: 88, column: 5, scope: !54)
!68 = !DILocation(line: 89, column: 5, scope: !54)
!69 = !DILocation(line: 90, column: 5, scope: !54)
!70 = !DILocation(line: 93, column: 5, scope: !54)
!71 = !DILocation(line: 94, column: 5, scope: !54)
!72 = !DILocation(line: 95, column: 5, scope: !54)
!73 = !DILocation(line: 97, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !17, line: 53, type: !4)
!76 = !DILocation(line: 53, column: 15, scope: !74)
!77 = !DILocation(line: 54, column: 23, scope: !74)
!78 = !DILocation(line: 54, column: 12, scope: !74)
!79 = !DILocation(line: 54, column: 10, scope: !74)
!80 = !DILocation(line: 55, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !74, file: !17, line: 55, column: 9)
!82 = !DILocation(line: 55, column: 14, scope: !81)
!83 = !DILocation(line: 55, column: 9, scope: !74)
!84 = !DILocation(line: 55, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !17, line: 55, column: 23)
!86 = !DILocation(line: 57, column: 13, scope: !74)
!87 = !DILocation(line: 57, column: 5, scope: !74)
!88 = !DILocation(line: 58, column: 5, scope: !74)
!89 = !DILocation(line: 58, column: 16, scope: !74)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !17, line: 60, type: !37)
!91 = distinct !DILexicalBlock(scope: !74, file: !17, line: 59, column: 5)
!92 = !DILocation(line: 60, column: 17, scope: !91)
!93 = !DILocation(line: 62, column: 18, scope: !91)
!94 = !DILocation(line: 62, column: 31, scope: !91)
!95 = !DILocation(line: 62, column: 24, scope: !91)
!96 = !DILocation(line: 62, column: 45, scope: !91)
!97 = !DILocation(line: 62, column: 9, scope: !91)
!98 = !DILocation(line: 63, column: 20, scope: !91)
!99 = !DILocation(line: 63, column: 9, scope: !91)
!100 = !DILocation(line: 64, column: 14, scope: !91)
!101 = !DILocation(line: 64, column: 9, scope: !91)
!102 = !DILocation(line: 66, column: 1, scope: !74)
