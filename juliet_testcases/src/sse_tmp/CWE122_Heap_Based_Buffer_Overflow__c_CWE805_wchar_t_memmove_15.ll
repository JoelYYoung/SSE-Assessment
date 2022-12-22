; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  %4 = bitcast i32* %3 to i8*, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !45
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !45
  %6 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !46
  store i32 0, i32* %arrayidx4, align 4, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %7), !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  %9 = bitcast i32* %8 to i8*, !dbg !50
  call void @free(i8* %9) #6, !dbg !51
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
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
  %call = call i64 @time(i64* null) #6, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #6, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32* null, i32** %data, align 8, !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !81
  %0 = bitcast i8* %call to i32*, !dbg !82
  store i32* %0, i32** %data, align 8, !dbg !83
  %1 = load i32*, i32** %data, align 8, !dbg !84
  %cmp = icmp eq i32* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !95
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !96
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx2, align 4, !dbg !98
  %3 = load i32*, i32** %data, align 8, !dbg !99
  %4 = bitcast i32* %3 to i8*, !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !100
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !101
  store i32 0, i32* %arrayidx4, align 4, !dbg !102
  %7 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* %7), !dbg !104
  %8 = load i32*, i32** %data, align 8, !dbg !105
  %9 = bitcast i32* %8 to i8*, !dbg !105
  call void @free(i8* %9) #6, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32* null, i32** %data, align 8, !dbg !111
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !112
  %0 = bitcast i8* %call to i32*, !dbg !113
  store i32* %0, i32** %data, align 8, !dbg !114
  %1 = load i32*, i32** %data, align 8, !dbg !115
  %cmp = icmp eq i32* %1, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !126
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !127
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx2, align 4, !dbg !129
  %3 = load i32*, i32** %data, align 8, !dbg !130
  %4 = bitcast i32* %3 to i8*, !dbg !131
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !131
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !131
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !131
  %6 = load i32*, i32** %data, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !132
  store i32 0, i32* %arrayidx4, align 4, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %7), !dbg !135
  %8 = load i32*, i32** %data, align 8, !dbg !136
  %9 = bitcast i32* %8 to i8*, !dbg !136
  call void @free(i8* %9) #6, !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 31, column: 27, scope: !16)
!24 = !DILocation(line: 31, column: 16, scope: !16)
!25 = !DILocation(line: 31, column: 14, scope: !16)
!26 = !DILocation(line: 32, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 13)
!28 = !DILocation(line: 32, column: 18, scope: !27)
!29 = !DILocation(line: 32, column: 13, scope: !16)
!30 = !DILocation(line: 32, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 32, column: 27)
!32 = !DILocation(line: 33, column: 9, scope: !16)
!33 = !DILocation(line: 33, column: 17, scope: !16)
!34 = !DILocalVariable(name: "source", scope: !35, file: !17, line: 41, type: !36)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 41, column: 17, scope: !35)
!40 = !DILocation(line: 42, column: 17, scope: !35)
!41 = !DILocation(line: 42, column: 9, scope: !35)
!42 = !DILocation(line: 43, column: 9, scope: !35)
!43 = !DILocation(line: 43, column: 23, scope: !35)
!44 = !DILocation(line: 45, column: 17, scope: !35)
!45 = !DILocation(line: 45, column: 9, scope: !35)
!46 = !DILocation(line: 46, column: 9, scope: !35)
!47 = !DILocation(line: 46, column: 21, scope: !35)
!48 = !DILocation(line: 47, column: 20, scope: !35)
!49 = !DILocation(line: 47, column: 9, scope: !35)
!50 = !DILocation(line: 48, column: 14, scope: !35)
!51 = !DILocation(line: 48, column: 9, scope: !35)
!52 = !DILocation(line: 50, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_15_good", scope: !17, file: !17, line: 116, type: !18, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 118, column: 5, scope: !53)
!55 = !DILocation(line: 119, column: 5, scope: !53)
!56 = !DILocation(line: 120, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 132, type: !58, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !17, line: 132, type: !7)
!64 = !DILocation(line: 132, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !17, line: 132, type: !60)
!66 = !DILocation(line: 132, column: 27, scope: !57)
!67 = !DILocation(line: 135, column: 22, scope: !57)
!68 = !DILocation(line: 135, column: 12, scope: !57)
!69 = !DILocation(line: 135, column: 5, scope: !57)
!70 = !DILocation(line: 137, column: 5, scope: !57)
!71 = !DILocation(line: 138, column: 5, scope: !57)
!72 = !DILocation(line: 139, column: 5, scope: !57)
!73 = !DILocation(line: 142, column: 5, scope: !57)
!74 = !DILocation(line: 143, column: 5, scope: !57)
!75 = !DILocation(line: 144, column: 5, scope: !57)
!76 = !DILocation(line: 146, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !17, line: 59, type: !4)
!79 = !DILocation(line: 59, column: 15, scope: !77)
!80 = !DILocation(line: 60, column: 10, scope: !77)
!81 = !DILocation(line: 69, column: 27, scope: !77)
!82 = !DILocation(line: 69, column: 16, scope: !77)
!83 = !DILocation(line: 69, column: 14, scope: !77)
!84 = !DILocation(line: 70, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !17, line: 70, column: 13)
!86 = !DILocation(line: 70, column: 18, scope: !85)
!87 = !DILocation(line: 70, column: 13, scope: !77)
!88 = !DILocation(line: 70, column: 28, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !17, line: 70, column: 27)
!90 = !DILocation(line: 71, column: 9, scope: !77)
!91 = !DILocation(line: 71, column: 17, scope: !77)
!92 = !DILocalVariable(name: "source", scope: !93, file: !17, line: 75, type: !36)
!93 = distinct !DILexicalBlock(scope: !77, file: !17, line: 74, column: 5)
!94 = !DILocation(line: 75, column: 17, scope: !93)
!95 = !DILocation(line: 76, column: 17, scope: !93)
!96 = !DILocation(line: 76, column: 9, scope: !93)
!97 = !DILocation(line: 77, column: 9, scope: !93)
!98 = !DILocation(line: 77, column: 23, scope: !93)
!99 = !DILocation(line: 79, column: 17, scope: !93)
!100 = !DILocation(line: 79, column: 9, scope: !93)
!101 = !DILocation(line: 80, column: 9, scope: !93)
!102 = !DILocation(line: 80, column: 21, scope: !93)
!103 = !DILocation(line: 81, column: 20, scope: !93)
!104 = !DILocation(line: 81, column: 9, scope: !93)
!105 = !DILocation(line: 82, column: 14, scope: !93)
!106 = !DILocation(line: 82, column: 9, scope: !93)
!107 = !DILocation(line: 84, column: 1, scope: !77)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 87, type: !18, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 89, type: !4)
!110 = !DILocation(line: 89, column: 15, scope: !108)
!111 = !DILocation(line: 90, column: 10, scope: !108)
!112 = !DILocation(line: 95, column: 27, scope: !108)
!113 = !DILocation(line: 95, column: 16, scope: !108)
!114 = !DILocation(line: 95, column: 14, scope: !108)
!115 = !DILocation(line: 96, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !17, line: 96, column: 13)
!117 = !DILocation(line: 96, column: 18, scope: !116)
!118 = !DILocation(line: 96, column: 13, scope: !108)
!119 = !DILocation(line: 96, column: 28, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !17, line: 96, column: 27)
!121 = !DILocation(line: 97, column: 9, scope: !108)
!122 = !DILocation(line: 97, column: 17, scope: !108)
!123 = !DILocalVariable(name: "source", scope: !124, file: !17, line: 105, type: !36)
!124 = distinct !DILexicalBlock(scope: !108, file: !17, line: 104, column: 5)
!125 = !DILocation(line: 105, column: 17, scope: !124)
!126 = !DILocation(line: 106, column: 17, scope: !124)
!127 = !DILocation(line: 106, column: 9, scope: !124)
!128 = !DILocation(line: 107, column: 9, scope: !124)
!129 = !DILocation(line: 107, column: 23, scope: !124)
!130 = !DILocation(line: 109, column: 17, scope: !124)
!131 = !DILocation(line: 109, column: 9, scope: !124)
!132 = !DILocation(line: 110, column: 9, scope: !124)
!133 = !DILocation(line: 110, column: 21, scope: !124)
!134 = !DILocation(line: 111, column: 20, scope: !124)
!135 = !DILocation(line: 111, column: 9, scope: !124)
!136 = !DILocation(line: 112, column: 14, scope: !124)
!137 = !DILocation(line: 112, column: 9, scope: !124)
!138 = !DILocation(line: 114, column: 1, scope: !108)
