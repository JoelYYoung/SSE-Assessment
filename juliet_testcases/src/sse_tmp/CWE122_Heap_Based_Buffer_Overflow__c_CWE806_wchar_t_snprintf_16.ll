; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16_bad() #0 !dbg !16 {
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
  br label %while.body, !dbg !31

while.body:                                       ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %while.end, !dbg !37

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %7), !dbg !50
  %8 = load i32*, i32** %data, align 8, !dbg !51
  %9 = bitcast i32* %8 to i8*, !dbg !51
  call void @free(i8* %9) #7, !dbg !52
  ret void, !dbg !53
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !80
  %0 = bitcast i8* %call to i32*, !dbg !81
  store i32* %0, i32** %data, align 8, !dbg !82
  %1 = load i32*, i32** %data, align 8, !dbg !83
  %cmp = icmp eq i32* %1, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  br label %while.body, !dbg !89

while.body:                                       ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !90
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !92
  %3 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  br label %while.end, !dbg !95

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !99
  %5 = load i32*, i32** %data, align 8, !dbg !100
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* %7), !dbg !105
  %8 = load i32*, i32** %data, align 8, !dbg !106
  %9 = bitcast i32* %8 to i8*, !dbg !106
  call void @free(i8* %9) #7, !dbg !107
  ret void, !dbg !108
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 34, column: 5, scope: !16)
!32 = !DILocation(line: 37, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!34 = !DILocation(line: 37, column: 9, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 21, scope: !33)
!37 = !DILocation(line: 39, column: 9, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !17, line: 42, type: !40)
!39 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 42, column: 17, scope: !39)
!44 = !DILocation(line: 44, column: 18, scope: !39)
!45 = !DILocation(line: 44, column: 31, scope: !39)
!46 = !DILocation(line: 44, column: 24, scope: !39)
!47 = !DILocation(line: 44, column: 45, scope: !39)
!48 = !DILocation(line: 44, column: 9, scope: !39)
!49 = !DILocation(line: 45, column: 20, scope: !39)
!50 = !DILocation(line: 45, column: 9, scope: !39)
!51 = !DILocation(line: 46, column: 14, scope: !39)
!52 = !DILocation(line: 46, column: 9, scope: !39)
!53 = !DILocation(line: 48, column: 1, scope: !16)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_16_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 78, column: 5, scope: !54)
!56 = !DILocation(line: 79, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 91, type: !58, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !17, line: 91, type: !7)
!64 = !DILocation(line: 91, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !17, line: 91, type: !60)
!66 = !DILocation(line: 91, column: 27, scope: !57)
!67 = !DILocation(line: 94, column: 22, scope: !57)
!68 = !DILocation(line: 94, column: 12, scope: !57)
!69 = !DILocation(line: 94, column: 5, scope: !57)
!70 = !DILocation(line: 96, column: 5, scope: !57)
!71 = !DILocation(line: 97, column: 5, scope: !57)
!72 = !DILocation(line: 98, column: 5, scope: !57)
!73 = !DILocation(line: 101, column: 5, scope: !57)
!74 = !DILocation(line: 102, column: 5, scope: !57)
!75 = !DILocation(line: 103, column: 5, scope: !57)
!76 = !DILocation(line: 105, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !17, line: 57, type: !4)
!79 = !DILocation(line: 57, column: 15, scope: !77)
!80 = !DILocation(line: 58, column: 23, scope: !77)
!81 = !DILocation(line: 58, column: 12, scope: !77)
!82 = !DILocation(line: 58, column: 10, scope: !77)
!83 = !DILocation(line: 59, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !17, line: 59, column: 9)
!85 = !DILocation(line: 59, column: 14, scope: !84)
!86 = !DILocation(line: 59, column: 9, scope: !77)
!87 = !DILocation(line: 59, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !17, line: 59, column: 23)
!89 = !DILocation(line: 60, column: 5, scope: !77)
!90 = !DILocation(line: 63, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !77, file: !17, line: 61, column: 5)
!92 = !DILocation(line: 63, column: 9, scope: !91)
!93 = !DILocation(line: 64, column: 9, scope: !91)
!94 = !DILocation(line: 64, column: 20, scope: !91)
!95 = !DILocation(line: 65, column: 9, scope: !91)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !17, line: 68, type: !40)
!97 = distinct !DILexicalBlock(scope: !77, file: !17, line: 67, column: 5)
!98 = !DILocation(line: 68, column: 17, scope: !97)
!99 = !DILocation(line: 70, column: 18, scope: !97)
!100 = !DILocation(line: 70, column: 31, scope: !97)
!101 = !DILocation(line: 70, column: 24, scope: !97)
!102 = !DILocation(line: 70, column: 45, scope: !97)
!103 = !DILocation(line: 70, column: 9, scope: !97)
!104 = !DILocation(line: 71, column: 20, scope: !97)
!105 = !DILocation(line: 71, column: 9, scope: !97)
!106 = !DILocation(line: 72, column: 14, scope: !97)
!107 = !DILocation(line: 72, column: 9, scope: !97)
!108 = !DILocation(line: 74, column: 1, scope: !77)
