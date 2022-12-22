; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %while.body, !dbg !23

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !24
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !34

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16_bad.source to i8*), i64 44, i1 false), !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %4 = bitcast i32* %3 to i8*, !dbg !42
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %5 = bitcast i32* %arraydecay to i8*, !dbg !42
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !43
  %call2 = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !44
  %add = add i64 %call2, 1, !dbg !45
  %mul = mul i64 %add, 4, !dbg !46
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %6), !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %8 = bitcast i32* %7 to i8*, !dbg !49
  call void @free(i8* %8) #7, !dbg !50
  ret void, !dbg !51
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #7, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #7, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i32* null, i32** %data, align 8, !dbg !78
  br label %while.body, !dbg !79

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !80
  %0 = bitcast i8* %call to i32*, !dbg !82
  store i32* %0, i32** %data, align 8, !dbg !83
  %1 = load i32*, i32** %data, align 8, !dbg !84
  %cmp = icmp eq i32* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !90

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !93
  %3 = load i32*, i32** %data, align 8, !dbg !94
  %4 = bitcast i32* %3 to i8*, !dbg !95
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !95
  %5 = bitcast i32* %arraydecay to i8*, !dbg !95
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !96
  %call2 = call i64 @wcslen(i32* %arraydecay1) #9, !dbg !97
  %add = add i64 %call2, 1, !dbg !98
  %mul = mul i64 %add, 4, !dbg !99
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 %mul, i1 false), !dbg !95
  %6 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %6), !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  %8 = bitcast i32* %7 to i8*, !dbg !102
  call void @free(i8* %8) #7, !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 32, column: 5, scope: !16)
!24 = !DILocation(line: 35, column: 27, scope: !25)
!25 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 5)
!26 = !DILocation(line: 35, column: 16, scope: !25)
!27 = !DILocation(line: 35, column: 14, scope: !25)
!28 = !DILocation(line: 36, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !17, line: 36, column: 13)
!30 = !DILocation(line: 36, column: 18, scope: !29)
!31 = !DILocation(line: 36, column: 13, scope: !25)
!32 = !DILocation(line: 36, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 36, column: 27)
!34 = !DILocation(line: 37, column: 9, scope: !25)
!35 = !DILocalVariable(name: "source", scope: !36, file: !17, line: 40, type: !37)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 40, column: 17, scope: !36)
!41 = !DILocation(line: 43, column: 17, scope: !36)
!42 = !DILocation(line: 43, column: 9, scope: !36)
!43 = !DILocation(line: 43, column: 39, scope: !36)
!44 = !DILocation(line: 43, column: 32, scope: !36)
!45 = !DILocation(line: 43, column: 47, scope: !36)
!46 = !DILocation(line: 43, column: 52, scope: !36)
!47 = !DILocation(line: 44, column: 20, scope: !36)
!48 = !DILocation(line: 44, column: 9, scope: !36)
!49 = !DILocation(line: 45, column: 14, scope: !36)
!50 = !DILocation(line: 45, column: 9, scope: !36)
!51 = !DILocation(line: 47, column: 1, scope: !16)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_16_good", scope: !17, file: !17, line: 75, type: !18, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 77, column: 5, scope: !52)
!54 = !DILocation(line: 78, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 90, type: !56, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !17, line: 90, type: !7)
!62 = !DILocation(line: 90, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !17, line: 90, type: !58)
!64 = !DILocation(line: 90, column: 27, scope: !55)
!65 = !DILocation(line: 93, column: 22, scope: !55)
!66 = !DILocation(line: 93, column: 12, scope: !55)
!67 = !DILocation(line: 93, column: 5, scope: !55)
!68 = !DILocation(line: 95, column: 5, scope: !55)
!69 = !DILocation(line: 96, column: 5, scope: !55)
!70 = !DILocation(line: 97, column: 5, scope: !55)
!71 = !DILocation(line: 100, column: 5, scope: !55)
!72 = !DILocation(line: 101, column: 5, scope: !55)
!73 = !DILocation(line: 102, column: 5, scope: !55)
!74 = !DILocation(line: 104, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !17, line: 56, type: !4)
!77 = !DILocation(line: 56, column: 15, scope: !75)
!78 = !DILocation(line: 57, column: 10, scope: !75)
!79 = !DILocation(line: 58, column: 5, scope: !75)
!80 = !DILocation(line: 61, column: 27, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !17, line: 59, column: 5)
!82 = !DILocation(line: 61, column: 16, scope: !81)
!83 = !DILocation(line: 61, column: 14, scope: !81)
!84 = !DILocation(line: 62, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !17, line: 62, column: 13)
!86 = !DILocation(line: 62, column: 18, scope: !85)
!87 = !DILocation(line: 62, column: 13, scope: !81)
!88 = !DILocation(line: 62, column: 28, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !17, line: 62, column: 27)
!90 = !DILocation(line: 63, column: 9, scope: !81)
!91 = !DILocalVariable(name: "source", scope: !92, file: !17, line: 66, type: !37)
!92 = distinct !DILexicalBlock(scope: !75, file: !17, line: 65, column: 5)
!93 = !DILocation(line: 66, column: 17, scope: !92)
!94 = !DILocation(line: 69, column: 17, scope: !92)
!95 = !DILocation(line: 69, column: 9, scope: !92)
!96 = !DILocation(line: 69, column: 39, scope: !92)
!97 = !DILocation(line: 69, column: 32, scope: !92)
!98 = !DILocation(line: 69, column: 47, scope: !92)
!99 = !DILocation(line: 69, column: 52, scope: !92)
!100 = !DILocation(line: 70, column: 20, scope: !92)
!101 = !DILocation(line: 70, column: 9, scope: !92)
!102 = !DILocation(line: 71, column: 14, scope: !92)
!103 = !DILocation(line: 71, column: 9, scope: !92)
!104 = !DILocation(line: 73, column: 1, scope: !75)
