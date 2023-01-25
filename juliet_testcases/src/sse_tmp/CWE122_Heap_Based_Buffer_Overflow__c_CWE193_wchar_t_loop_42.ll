; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42_bad.source to i8*), i64 44, i1 false), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !36, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !38
  %call1 = call i64 @wcslen(i32* %arraydecay) #7, !dbg !39
  store i64 %call1, i64* %sourceLen, align 8, !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !44
  %3 = load i64, i64* %sourceLen, align 8, !dbg !46
  %add = add i64 %3, 1, !dbg !47
  %cmp = icmp ult i64 %2, %add, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !52
  %5 = load i32, i32* %arrayidx, align 4, !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %7 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !53
  store i32 %5, i32* %arrayidx2, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %8, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !62
  call void @printWLine(i32* %9), !dbg !63
  %10 = load i32*, i32** %data, align 8, !dbg !64
  %11 = bitcast i32* %10 to i8*, !dbg !64
  call void @free(i8* %11) #8, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !67 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !72
  %0 = bitcast i8* %call to i32*, !dbg !73
  store i32* %0, i32** %data.addr, align 8, !dbg !74
  %1 = load i32*, i32** %data.addr, align 8, !dbg !75
  %cmp = icmp eq i32* %1, null, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !81
  ret i32* %2, !dbg !82
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #8, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #8, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
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
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32* null, i32** %data, align 8, !dbg !109
  %0 = load i32*, i32** %data, align 8, !dbg !110
  %call = call i32* @goodG2BSource(i32* %0), !dbg !111
  store i32* %call, i32** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !120
  %call1 = call i64 @wcslen(i32* %arraydecay) #7, !dbg !121
  store i64 %call1, i64* %sourceLen, align 8, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !126
  %3 = load i64, i64* %sourceLen, align 8, !dbg !128
  %add = add i64 %3, 1, !dbg !129
  %cmp = icmp ult i64 %2, %add, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !134
  %5 = load i32, i32* %arrayidx, align 4, !dbg !134
  %6 = load i32*, i32** %data, align 8, !dbg !135
  %7 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !135
  store i32 %5, i32* %arrayidx2, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %8, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %9), !dbg !144
  %10 = load i32*, i32** %data, align 8, !dbg !145
  %11 = bitcast i32* %10 to i8*, !dbg !145
  call void @free(i8* %11) #8, !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !148 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !149, metadata !DIExpression()), !dbg !150
  %call = call noalias align 16 i8* @malloc(i64 44) #8, !dbg !151
  %0 = bitcast i8* %call to i32*, !dbg !152
  store i32* %0, i32** %data.addr, align 8, !dbg !153
  %1 = load i32*, i32** %data.addr, align 8, !dbg !154
  %cmp = icmp eq i32* %1, null, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !160
  ret i32* %2, !dbg !161
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42_bad", scope: !17, file: !17, line: 36, type: !18, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!32 = !DILocalVariable(name: "i", scope: !27, file: !17, line: 43, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !34)
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 43, column: 16, scope: !27)
!36 = !DILocalVariable(name: "sourceLen", scope: !27, file: !17, line: 43, type: !33)
!37 = !DILocation(line: 43, column: 19, scope: !27)
!38 = !DILocation(line: 44, column: 28, scope: !27)
!39 = !DILocation(line: 44, column: 21, scope: !27)
!40 = !DILocation(line: 44, column: 19, scope: !27)
!41 = !DILocation(line: 47, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !27, file: !17, line: 47, column: 9)
!43 = !DILocation(line: 47, column: 14, scope: !42)
!44 = !DILocation(line: 47, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !17, line: 47, column: 9)
!46 = !DILocation(line: 47, column: 25, scope: !45)
!47 = !DILocation(line: 47, column: 35, scope: !45)
!48 = !DILocation(line: 47, column: 23, scope: !45)
!49 = !DILocation(line: 47, column: 9, scope: !42)
!50 = !DILocation(line: 49, column: 30, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !17, line: 48, column: 9)
!52 = !DILocation(line: 49, column: 23, scope: !51)
!53 = !DILocation(line: 49, column: 13, scope: !51)
!54 = !DILocation(line: 49, column: 18, scope: !51)
!55 = !DILocation(line: 49, column: 21, scope: !51)
!56 = !DILocation(line: 50, column: 9, scope: !51)
!57 = !DILocation(line: 47, column: 41, scope: !45)
!58 = !DILocation(line: 47, column: 9, scope: !45)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 50, column: 9, scope: !42)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 51, column: 20, scope: !27)
!63 = !DILocation(line: 51, column: 9, scope: !27)
!64 = !DILocation(line: 52, column: 14, scope: !27)
!65 = !DILocation(line: 52, column: 9, scope: !27)
!66 = !DILocation(line: 54, column: 1, scope: !16)
!67 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 28, type: !68, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!5, !5}
!70 = !DILocalVariable(name: "data", arg: 1, scope: !67, file: !17, line: 28, type: !5)
!71 = !DILocation(line: 28, column: 38, scope: !67)
!72 = !DILocation(line: 31, column: 23, scope: !67)
!73 = !DILocation(line: 31, column: 12, scope: !67)
!74 = !DILocation(line: 31, column: 10, scope: !67)
!75 = !DILocation(line: 32, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !67, file: !17, line: 32, column: 9)
!77 = !DILocation(line: 32, column: 14, scope: !76)
!78 = !DILocation(line: 32, column: 9, scope: !67)
!79 = !DILocation(line: 32, column: 24, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !17, line: 32, column: 23)
!81 = !DILocation(line: 33, column: 12, scope: !67)
!82 = !DILocation(line: 33, column: 5, scope: !67)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_42_good", scope: !17, file: !17, line: 89, type: !18, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 91, column: 5, scope: !83)
!85 = !DILocation(line: 92, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 104, type: !87, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!8, !8, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !17, line: 104, type: !8)
!93 = !DILocation(line: 104, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !17, line: 104, type: !89)
!95 = !DILocation(line: 104, column: 27, scope: !86)
!96 = !DILocation(line: 107, column: 22, scope: !86)
!97 = !DILocation(line: 107, column: 12, scope: !86)
!98 = !DILocation(line: 107, column: 5, scope: !86)
!99 = !DILocation(line: 109, column: 5, scope: !86)
!100 = !DILocation(line: 110, column: 5, scope: !86)
!101 = !DILocation(line: 111, column: 5, scope: !86)
!102 = !DILocation(line: 114, column: 5, scope: !86)
!103 = !DILocation(line: 115, column: 5, scope: !86)
!104 = !DILocation(line: 116, column: 5, scope: !86)
!105 = !DILocation(line: 118, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 69, type: !18, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !17, line: 71, type: !5)
!108 = !DILocation(line: 71, column: 15, scope: !106)
!109 = !DILocation(line: 72, column: 10, scope: !106)
!110 = !DILocation(line: 73, column: 26, scope: !106)
!111 = !DILocation(line: 73, column: 12, scope: !106)
!112 = !DILocation(line: 73, column: 10, scope: !106)
!113 = !DILocalVariable(name: "source", scope: !114, file: !17, line: 75, type: !28)
!114 = distinct !DILexicalBlock(scope: !106, file: !17, line: 74, column: 5)
!115 = !DILocation(line: 75, column: 17, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !114, file: !17, line: 76, type: !33)
!117 = !DILocation(line: 76, column: 16, scope: !114)
!118 = !DILocalVariable(name: "sourceLen", scope: !114, file: !17, line: 76, type: !33)
!119 = !DILocation(line: 76, column: 19, scope: !114)
!120 = !DILocation(line: 77, column: 28, scope: !114)
!121 = !DILocation(line: 77, column: 21, scope: !114)
!122 = !DILocation(line: 77, column: 19, scope: !114)
!123 = !DILocation(line: 80, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !17, line: 80, column: 9)
!125 = !DILocation(line: 80, column: 14, scope: !124)
!126 = !DILocation(line: 80, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !17, line: 80, column: 9)
!128 = !DILocation(line: 80, column: 25, scope: !127)
!129 = !DILocation(line: 80, column: 35, scope: !127)
!130 = !DILocation(line: 80, column: 23, scope: !127)
!131 = !DILocation(line: 80, column: 9, scope: !124)
!132 = !DILocation(line: 82, column: 30, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !17, line: 81, column: 9)
!134 = !DILocation(line: 82, column: 23, scope: !133)
!135 = !DILocation(line: 82, column: 13, scope: !133)
!136 = !DILocation(line: 82, column: 18, scope: !133)
!137 = !DILocation(line: 82, column: 21, scope: !133)
!138 = !DILocation(line: 83, column: 9, scope: !133)
!139 = !DILocation(line: 80, column: 41, scope: !127)
!140 = !DILocation(line: 80, column: 9, scope: !127)
!141 = distinct !{!141, !131, !142, !61}
!142 = !DILocation(line: 83, column: 9, scope: !124)
!143 = !DILocation(line: 84, column: 20, scope: !114)
!144 = !DILocation(line: 84, column: 9, scope: !114)
!145 = !DILocation(line: 85, column: 14, scope: !114)
!146 = !DILocation(line: 85, column: 9, scope: !114)
!147 = !DILocation(line: 87, column: 1, scope: !106)
!148 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 60, type: !68, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", arg: 1, scope: !148, file: !17, line: 60, type: !5)
!150 = !DILocation(line: 60, column: 42, scope: !148)
!151 = !DILocation(line: 63, column: 23, scope: !148)
!152 = !DILocation(line: 63, column: 12, scope: !148)
!153 = !DILocation(line: 63, column: 10, scope: !148)
!154 = !DILocation(line: 64, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !148, file: !17, line: 64, column: 9)
!156 = !DILocation(line: 64, column: 14, scope: !155)
!157 = !DILocation(line: 64, column: 9, scope: !148)
!158 = !DILocation(line: 64, column: 24, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !17, line: 64, column: 23)
!160 = !DILocation(line: 65, column: 12, scope: !148)
!161 = !DILocation(line: 65, column: 5, scope: !148)
