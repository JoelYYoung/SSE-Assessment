; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01_bad.source to i8*), i64 44, i1 false), !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %4 = bitcast i32* %3 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !39
  %5 = bitcast i32* %arraydecay to i8*, !dbg !39
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !40
  %call2 = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !41
  %add = add i64 %call2, 1, !dbg !42
  %mul = mul i64 %add, 4, !dbg !43
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %6), !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !46
  %8 = bitcast i32* %7 to i8*, !dbg !46
  call void @free(i8* %8) #7, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32* null, i32** %data, align 8, !dbg !75
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !76
  %0 = bitcast i8* %call to i32*, !dbg !77
  store i32* %0, i32** %data, align 8, !dbg !78
  %1 = load i32*, i32** %data, align 8, !dbg !79
  %cmp = icmp eq i32* %1, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !87
  %3 = load i32*, i32** %data, align 8, !dbg !88
  %4 = bitcast i32* %3 to i8*, !dbg !89
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !89
  %5 = bitcast i32* %arraydecay to i8*, !dbg !89
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !90
  %call2 = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !91
  %add = add i64 %call2, 1, !dbg !92
  %mul = mul i64 %add, 4, !dbg !93
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !89
  %6 = load i32*, i32** %data, align 8, !dbg !94
  call void @printWLine(i32* %6), !dbg !95
  %7 = load i32*, i32** %data, align 8, !dbg !96
  %8 = bitcast i32* %7 to i8*, !dbg !96
  call void @free(i8* %8) #7, !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 33, column: 23, scope: !16)
!24 = !DILocation(line: 33, column: 12, scope: !16)
!25 = !DILocation(line: 33, column: 10, scope: !16)
!26 = !DILocation(line: 34, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 9)
!28 = !DILocation(line: 34, column: 14, scope: !27)
!29 = !DILocation(line: 34, column: 9, scope: !16)
!30 = !DILocation(line: 34, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 34, column: 23)
!32 = !DILocalVariable(name: "source", scope: !33, file: !17, line: 36, type: !34)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 36, column: 17, scope: !33)
!38 = !DILocation(line: 39, column: 17, scope: !33)
!39 = !DILocation(line: 39, column: 9, scope: !33)
!40 = !DILocation(line: 39, column: 39, scope: !33)
!41 = !DILocation(line: 39, column: 32, scope: !33)
!42 = !DILocation(line: 39, column: 47, scope: !33)
!43 = !DILocation(line: 39, column: 52, scope: !33)
!44 = !DILocation(line: 40, column: 20, scope: !33)
!45 = !DILocation(line: 40, column: 9, scope: !33)
!46 = !DILocation(line: 41, column: 14, scope: !33)
!47 = !DILocation(line: 41, column: 9, scope: !33)
!48 = !DILocation(line: 43, column: 1, scope: !16)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_01_good", scope: !17, file: !17, line: 67, type: !18, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 69, column: 5, scope: !49)
!51 = !DILocation(line: 70, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 82, type: !53, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !17, line: 82, type: !7)
!59 = !DILocation(line: 82, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !17, line: 82, type: !55)
!61 = !DILocation(line: 82, column: 27, scope: !52)
!62 = !DILocation(line: 85, column: 22, scope: !52)
!63 = !DILocation(line: 85, column: 12, scope: !52)
!64 = !DILocation(line: 85, column: 5, scope: !52)
!65 = !DILocation(line: 87, column: 5, scope: !52)
!66 = !DILocation(line: 88, column: 5, scope: !52)
!67 = !DILocation(line: 89, column: 5, scope: !52)
!68 = !DILocation(line: 92, column: 5, scope: !52)
!69 = !DILocation(line: 93, column: 5, scope: !52)
!70 = !DILocation(line: 94, column: 5, scope: !52)
!71 = !DILocation(line: 96, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 50, type: !18, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !17, line: 52, type: !4)
!74 = !DILocation(line: 52, column: 15, scope: !72)
!75 = !DILocation(line: 53, column: 10, scope: !72)
!76 = !DILocation(line: 55, column: 23, scope: !72)
!77 = !DILocation(line: 55, column: 12, scope: !72)
!78 = !DILocation(line: 55, column: 10, scope: !72)
!79 = !DILocation(line: 56, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !17, line: 56, column: 9)
!81 = !DILocation(line: 56, column: 14, scope: !80)
!82 = !DILocation(line: 56, column: 9, scope: !72)
!83 = !DILocation(line: 56, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !17, line: 56, column: 23)
!85 = !DILocalVariable(name: "source", scope: !86, file: !17, line: 58, type: !34)
!86 = distinct !DILexicalBlock(scope: !72, file: !17, line: 57, column: 5)
!87 = !DILocation(line: 58, column: 17, scope: !86)
!88 = !DILocation(line: 61, column: 17, scope: !86)
!89 = !DILocation(line: 61, column: 9, scope: !86)
!90 = !DILocation(line: 61, column: 39, scope: !86)
!91 = !DILocation(line: 61, column: 32, scope: !86)
!92 = !DILocation(line: 61, column: 47, scope: !86)
!93 = !DILocation(line: 61, column: 52, scope: !86)
!94 = !DILocation(line: 62, column: 20, scope: !86)
!95 = !DILocation(line: 62, column: 9, scope: !86)
!96 = !DILocation(line: 63, column: 14, scope: !86)
!97 = !DILocation(line: 63, column: 9, scope: !86)
!98 = !DILocation(line: 65, column: 1, scope: !72)
