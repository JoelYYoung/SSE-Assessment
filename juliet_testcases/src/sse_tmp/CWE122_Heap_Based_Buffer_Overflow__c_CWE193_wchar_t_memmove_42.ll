; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42_bad.source to i8*), i64 44, i1 false), !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %3 = bitcast i32* %2 to i8*, !dbg !33
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !33
  %4 = bitcast i32* %arraydecay to i8*, !dbg !33
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !34
  %call2 = call i64 @wcslen(i32* %arraydecay1) #7, !dbg !35
  %add = add i64 %call2, 1, !dbg !36
  %mul = mul i64 %add, 4, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !38
  call void @printWLine(i32* %5), !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %7 = bitcast i32* %6 to i8*, !dbg !40
  call void @free(i8* %7) #8, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !48
  %0 = bitcast i8* %call to i32*, !dbg !49
  store i32* %0, i32** %data.addr, align 8, !dbg !50
  %1 = load i32*, i32** %data.addr, align 8, !dbg !51
  %cmp = icmp eq i32* %1, null, !dbg !53
  br i1 %cmp, label %if.then, label %if.end, !dbg !54

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !55
  unreachable, !dbg !55

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !57
  ret i32* %2, !dbg !58
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #8, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #8, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %0 = load i32*, i32** %data, align 8, !dbg !86
  %call = call i32* @goodG2BSource(i32* %0), !dbg !87
  store i32* %call, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !91
  %2 = load i32*, i32** %data, align 8, !dbg !92
  %3 = bitcast i32* %2 to i8*, !dbg !93
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !93
  %4 = bitcast i32* %arraydecay to i8*, !dbg !93
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !94
  %call2 = call i64 @wcslen(i32* %arraydecay1) #7, !dbg !95
  %add = add i64 %call2, 1, !dbg !96
  %mul = mul i64 %add, 4, !dbg !97
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !93
  %5 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* %5), !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  %7 = bitcast i32* %6 to i8*, !dbg !100
  call void @free(i8* %7) #8, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !103 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 44) #8, !dbg !106
  %0 = bitcast i8* %call to i32*, !dbg !107
  store i32* %0, i32** %data.addr, align 8, !dbg !108
  %1 = load i32*, i32** %data.addr, align 8, !dbg !109
  %cmp = icmp eq i32* %1, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !115
  ret i32* %2, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42_bad", scope: !17, file: !17, line: 36, type: !18, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 38, type: !5)
!21 = !DILocation(line: 38, column: 15, scope: !16)
!22 = !DILocation(line: 39, column: 10, scope: !16)
!23 = !DILocation(line: 40, column: 22, scope: !16)
!24 = !DILocation(line: 40, column: 12, scope: !16)
!25 = !DILocation(line: 40, column: 10, scope: !16)
!26 = !DILocalVariable(name: "source", scope: !27, file: !17, line: 42, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 352, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 11)
!31 = !DILocation(line: 42, column: 17, scope: !27)
!32 = !DILocation(line: 45, column: 17, scope: !27)
!33 = !DILocation(line: 45, column: 9, scope: !27)
!34 = !DILocation(line: 45, column: 39, scope: !27)
!35 = !DILocation(line: 45, column: 32, scope: !27)
!36 = !DILocation(line: 45, column: 47, scope: !27)
!37 = !DILocation(line: 45, column: 52, scope: !27)
!38 = !DILocation(line: 46, column: 20, scope: !27)
!39 = !DILocation(line: 46, column: 9, scope: !27)
!40 = !DILocation(line: 47, column: 14, scope: !27)
!41 = !DILocation(line: 47, column: 9, scope: !27)
!42 = !DILocation(line: 49, column: 1, scope: !16)
!43 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 28, type: !44, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!5, !5}
!46 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !17, line: 28, type: !5)
!47 = !DILocation(line: 28, column: 38, scope: !43)
!48 = !DILocation(line: 31, column: 23, scope: !43)
!49 = !DILocation(line: 31, column: 12, scope: !43)
!50 = !DILocation(line: 31, column: 10, scope: !43)
!51 = !DILocation(line: 32, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !17, line: 32, column: 9)
!53 = !DILocation(line: 32, column: 14, scope: !52)
!54 = !DILocation(line: 32, column: 9, scope: !43)
!55 = !DILocation(line: 32, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !17, line: 32, column: 23)
!57 = !DILocation(line: 33, column: 12, scope: !43)
!58 = !DILocation(line: 33, column: 5, scope: !43)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_42_good", scope: !17, file: !17, line: 79, type: !18, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 81, column: 5, scope: !59)
!61 = !DILocation(line: 82, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 94, type: !63, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!8, !8, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !17, line: 94, type: !8)
!69 = !DILocation(line: 94, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !17, line: 94, type: !65)
!71 = !DILocation(line: 94, column: 27, scope: !62)
!72 = !DILocation(line: 97, column: 22, scope: !62)
!73 = !DILocation(line: 97, column: 12, scope: !62)
!74 = !DILocation(line: 97, column: 5, scope: !62)
!75 = !DILocation(line: 99, column: 5, scope: !62)
!76 = !DILocation(line: 100, column: 5, scope: !62)
!77 = !DILocation(line: 101, column: 5, scope: !62)
!78 = !DILocation(line: 104, column: 5, scope: !62)
!79 = !DILocation(line: 105, column: 5, scope: !62)
!80 = !DILocation(line: 106, column: 5, scope: !62)
!81 = !DILocation(line: 108, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 66, type: !5)
!84 = !DILocation(line: 66, column: 15, scope: !82)
!85 = !DILocation(line: 67, column: 10, scope: !82)
!86 = !DILocation(line: 68, column: 26, scope: !82)
!87 = !DILocation(line: 68, column: 12, scope: !82)
!88 = !DILocation(line: 68, column: 10, scope: !82)
!89 = !DILocalVariable(name: "source", scope: !90, file: !17, line: 70, type: !28)
!90 = distinct !DILexicalBlock(scope: !82, file: !17, line: 69, column: 5)
!91 = !DILocation(line: 70, column: 17, scope: !90)
!92 = !DILocation(line: 73, column: 17, scope: !90)
!93 = !DILocation(line: 73, column: 9, scope: !90)
!94 = !DILocation(line: 73, column: 39, scope: !90)
!95 = !DILocation(line: 73, column: 32, scope: !90)
!96 = !DILocation(line: 73, column: 47, scope: !90)
!97 = !DILocation(line: 73, column: 52, scope: !90)
!98 = !DILocation(line: 74, column: 20, scope: !90)
!99 = !DILocation(line: 74, column: 9, scope: !90)
!100 = !DILocation(line: 75, column: 14, scope: !90)
!101 = !DILocation(line: 75, column: 9, scope: !90)
!102 = !DILocation(line: 77, column: 1, scope: !82)
!103 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 55, type: !44, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", arg: 1, scope: !103, file: !17, line: 55, type: !5)
!105 = !DILocation(line: 55, column: 42, scope: !103)
!106 = !DILocation(line: 58, column: 23, scope: !103)
!107 = !DILocation(line: 58, column: 12, scope: !103)
!108 = !DILocation(line: 58, column: 10, scope: !103)
!109 = !DILocation(line: 59, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !17, line: 59, column: 9)
!111 = !DILocation(line: 59, column: 14, scope: !110)
!112 = !DILocation(line: 59, column: 9, scope: !103)
!113 = !DILocation(line: 59, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 59, column: 23)
!115 = !DILocation(line: 60, column: 12, scope: !103)
!116 = !DILocation(line: 60, column: 5, scope: !103)
