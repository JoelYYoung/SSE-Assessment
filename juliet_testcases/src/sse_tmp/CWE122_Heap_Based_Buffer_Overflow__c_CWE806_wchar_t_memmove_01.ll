; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #8, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !41
  %5 = bitcast i32* %arraydecay to i8*, !dbg !41
  %6 = load i32*, i32** %data, align 8, !dbg !42
  %7 = bitcast i32* %6 to i8*, !dbg !41
  %8 = load i32*, i32** %data, align 8, !dbg !43
  %call2 = call i64 @wcslen(i32* %8) #10, !dbg !44
  %mul = mul i64 %call2, 4, !dbg !45
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !41
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !46
  store i32 0, i32* %arrayidx3, align 4, !dbg !47
  %9 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %9), !dbg !49
  %10 = load i32*, i32** %data, align 8, !dbg !50
  %11 = bitcast i32* %10 to i8*, !dbg !50
  call void @free(i8* %11) #8, !dbg !51
  ret void, !dbg !52
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #8, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #8, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #7

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !79
  %0 = bitcast i8* %call to i32*, !dbg !80
  store i32* %0, i32** %data, align 8, !dbg !81
  %1 = load i32*, i32** %data, align 8, !dbg !82
  %cmp = icmp eq i32* %1, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !89
  %3 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !95
  %5 = bitcast i32* %arraydecay to i8*, !dbg !95
  %6 = load i32*, i32** %data, align 8, !dbg !96
  %7 = bitcast i32* %6 to i8*, !dbg !95
  %8 = load i32*, i32** %data, align 8, !dbg !97
  %call2 = call i64 @wcslen(i32* %8) #10, !dbg !98
  %mul = mul i64 %call2, 4, !dbg !99
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !95
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !100
  store i32 0, i32* %arrayidx3, align 4, !dbg !101
  %9 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %9), !dbg !103
  %10 = load i32*, i32** %data, align 8, !dbg !104
  %11 = bitcast i32* %10 to i8*, !dbg !104
  call void @free(i8* %11) #8, !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 29, column: 13, scope: !16)
!32 = !DILocation(line: 29, column: 5, scope: !16)
!33 = !DILocation(line: 30, column: 5, scope: !16)
!34 = !DILocation(line: 30, column: 17, scope: !16)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !17, line: 32, type: !37)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 32, column: 17, scope: !36)
!41 = !DILocation(line: 34, column: 9, scope: !36)
!42 = !DILocation(line: 34, column: 23, scope: !36)
!43 = !DILocation(line: 34, column: 36, scope: !36)
!44 = !DILocation(line: 34, column: 29, scope: !36)
!45 = !DILocation(line: 34, column: 41, scope: !36)
!46 = !DILocation(line: 35, column: 9, scope: !36)
!47 = !DILocation(line: 35, column: 20, scope: !36)
!48 = !DILocation(line: 36, column: 20, scope: !36)
!49 = !DILocation(line: 36, column: 9, scope: !36)
!50 = !DILocation(line: 37, column: 14, scope: !36)
!51 = !DILocation(line: 37, column: 9, scope: !36)
!52 = !DILocation(line: 39, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_01_good", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 66, column: 5, scope: !53)
!55 = !DILocation(line: 67, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 79, type: !57, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!7, !7, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !17, line: 79, type: !7)
!63 = !DILocation(line: 79, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !17, line: 79, type: !59)
!65 = !DILocation(line: 79, column: 27, scope: !56)
!66 = !DILocation(line: 82, column: 22, scope: !56)
!67 = !DILocation(line: 82, column: 12, scope: !56)
!68 = !DILocation(line: 82, column: 5, scope: !56)
!69 = !DILocation(line: 84, column: 5, scope: !56)
!70 = !DILocation(line: 85, column: 5, scope: !56)
!71 = !DILocation(line: 86, column: 5, scope: !56)
!72 = !DILocation(line: 89, column: 5, scope: !56)
!73 = !DILocation(line: 90, column: 5, scope: !56)
!74 = !DILocation(line: 91, column: 5, scope: !56)
!75 = !DILocation(line: 93, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 46, type: !18, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !17, line: 48, type: !4)
!78 = !DILocation(line: 48, column: 15, scope: !76)
!79 = !DILocation(line: 49, column: 23, scope: !76)
!80 = !DILocation(line: 49, column: 12, scope: !76)
!81 = !DILocation(line: 49, column: 10, scope: !76)
!82 = !DILocation(line: 50, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !76, file: !17, line: 50, column: 9)
!84 = !DILocation(line: 50, column: 14, scope: !83)
!85 = !DILocation(line: 50, column: 9, scope: !76)
!86 = !DILocation(line: 50, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !17, line: 50, column: 23)
!88 = !DILocation(line: 52, column: 13, scope: !76)
!89 = !DILocation(line: 52, column: 5, scope: !76)
!90 = !DILocation(line: 53, column: 5, scope: !76)
!91 = !DILocation(line: 53, column: 16, scope: !76)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !17, line: 55, type: !37)
!93 = distinct !DILexicalBlock(scope: !76, file: !17, line: 54, column: 5)
!94 = !DILocation(line: 55, column: 17, scope: !93)
!95 = !DILocation(line: 57, column: 9, scope: !93)
!96 = !DILocation(line: 57, column: 23, scope: !93)
!97 = !DILocation(line: 57, column: 36, scope: !93)
!98 = !DILocation(line: 57, column: 29, scope: !93)
!99 = !DILocation(line: 57, column: 41, scope: !93)
!100 = !DILocation(line: 58, column: 9, scope: !93)
!101 = !DILocation(line: 58, column: 20, scope: !93)
!102 = !DILocation(line: 59, column: 20, scope: !93)
!103 = !DILocation(line: 59, column: 9, scope: !93)
!104 = !DILocation(line: 60, column: 14, scope: !93)
!105 = !DILocation(line: 60, column: 9, scope: !93)
!106 = !DILocation(line: 62, column: 1, scope: !76)
