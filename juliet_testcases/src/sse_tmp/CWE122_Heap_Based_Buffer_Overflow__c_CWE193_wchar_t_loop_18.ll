; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source1 = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %source, !dbg !23

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !24), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [11 x i32]* %source1, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [11 x i32]* %source1 to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18_bad.source to i8*), i64 44, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !47
  %call2 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !48
  store i64 %call2, i64* %sourceLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !53
  %4 = load i64, i64* %sourceLen, align 8, !dbg !55
  %add = add i64 %4, 1, !dbg !56
  %cmp3 = icmp ult i64 %3, %add, !dbg !57
  br i1 %cmp3, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 %5, !dbg !61
  %6 = load i32, i32* %arrayidx, align 4, !dbg !61
  %7 = load i32*, i32** %data, align 8, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !62
  store i32 %6, i32* %arrayidx4, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %9, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %10), !dbg !72
  %11 = load i32*, i32** %data, align 8, !dbg !73
  %12 = bitcast i32* %11 to i8*, !dbg !73
  call void @free(i8* %12) #7, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source1 = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32* null, i32** %data, align 8, !dbg !102
  br label %source, !dbg !103

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !104), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !106
  %0 = bitcast i8* %call to i32*, !dbg !107
  store i32* %0, i32** %data, align 8, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !109
  %cmp = icmp eq i32* %1, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [11 x i32]* %source1, metadata !115, metadata !DIExpression()), !dbg !117
  %2 = bitcast [11 x i32]* %source1 to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !122
  %call2 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !123
  store i64 %call2, i64* %sourceLen, align 8, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !128
  %4 = load i64, i64* %sourceLen, align 8, !dbg !130
  %add = add i64 %4, 1, !dbg !131
  %cmp3 = icmp ult i64 %3, %add, !dbg !132
  br i1 %cmp3, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 %5, !dbg !136
  %6 = load i32, i32* %arrayidx, align 4, !dbg !136
  %7 = load i32*, i32** %data, align 8, !dbg !137
  %8 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !137
  store i32 %6, i32* %arrayidx4, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %9, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* %10), !dbg !146
  %11 = load i32*, i32** %data, align 8, !dbg !147
  %12 = bitcast i32* %11 to i8*, !dbg !147
  call void @free(i8* %12) #7, !dbg !148
  ret void, !dbg !149
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 32, column: 5, scope: !16)
!24 = !DILabel(scope: !16, name: "source", file: !17, line: 33)
!25 = !DILocation(line: 33, column: 1, scope: !16)
!26 = !DILocation(line: 35, column: 23, scope: !16)
!27 = !DILocation(line: 35, column: 12, scope: !16)
!28 = !DILocation(line: 35, column: 10, scope: !16)
!29 = !DILocation(line: 36, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 9)
!31 = !DILocation(line: 36, column: 14, scope: !30)
!32 = !DILocation(line: 36, column: 9, scope: !16)
!33 = !DILocation(line: 36, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !17, line: 36, column: 23)
!35 = !DILocalVariable(name: "source", scope: !36, file: !17, line: 38, type: !37)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 38, column: 17, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !17, line: 39, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 39, column: 16, scope: !36)
!45 = !DILocalVariable(name: "sourceLen", scope: !36, file: !17, line: 39, type: !42)
!46 = !DILocation(line: 39, column: 19, scope: !36)
!47 = !DILocation(line: 40, column: 28, scope: !36)
!48 = !DILocation(line: 40, column: 21, scope: !36)
!49 = !DILocation(line: 40, column: 19, scope: !36)
!50 = !DILocation(line: 43, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !36, file: !17, line: 43, column: 9)
!52 = !DILocation(line: 43, column: 14, scope: !51)
!53 = !DILocation(line: 43, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !17, line: 43, column: 9)
!55 = !DILocation(line: 43, column: 25, scope: !54)
!56 = !DILocation(line: 43, column: 35, scope: !54)
!57 = !DILocation(line: 43, column: 23, scope: !54)
!58 = !DILocation(line: 43, column: 9, scope: !51)
!59 = !DILocation(line: 45, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !17, line: 44, column: 9)
!61 = !DILocation(line: 45, column: 23, scope: !60)
!62 = !DILocation(line: 45, column: 13, scope: !60)
!63 = !DILocation(line: 45, column: 18, scope: !60)
!64 = !DILocation(line: 45, column: 21, scope: !60)
!65 = !DILocation(line: 46, column: 9, scope: !60)
!66 = !DILocation(line: 43, column: 41, scope: !54)
!67 = !DILocation(line: 43, column: 9, scope: !54)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 46, column: 9, scope: !51)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 47, column: 20, scope: !36)
!72 = !DILocation(line: 47, column: 9, scope: !36)
!73 = !DILocation(line: 48, column: 14, scope: !36)
!74 = !DILocation(line: 48, column: 9, scope: !36)
!75 = !DILocation(line: 50, column: 1, scope: !16)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_18_good", scope: !17, file: !17, line: 81, type: !18, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 83, column: 5, scope: !76)
!78 = !DILocation(line: 84, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 96, type: !80, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !17, line: 96, type: !7)
!86 = !DILocation(line: 96, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !17, line: 96, type: !82)
!88 = !DILocation(line: 96, column: 27, scope: !79)
!89 = !DILocation(line: 99, column: 22, scope: !79)
!90 = !DILocation(line: 99, column: 12, scope: !79)
!91 = !DILocation(line: 99, column: 5, scope: !79)
!92 = !DILocation(line: 101, column: 5, scope: !79)
!93 = !DILocation(line: 102, column: 5, scope: !79)
!94 = !DILocation(line: 103, column: 5, scope: !79)
!95 = !DILocation(line: 106, column: 5, scope: !79)
!96 = !DILocation(line: 107, column: 5, scope: !79)
!97 = !DILocation(line: 108, column: 5, scope: !79)
!98 = !DILocation(line: 110, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !17, line: 59, type: !4)
!101 = !DILocation(line: 59, column: 15, scope: !99)
!102 = !DILocation(line: 60, column: 10, scope: !99)
!103 = !DILocation(line: 61, column: 5, scope: !99)
!104 = !DILabel(scope: !99, name: "source", file: !17, line: 62)
!105 = !DILocation(line: 62, column: 1, scope: !99)
!106 = !DILocation(line: 64, column: 23, scope: !99)
!107 = !DILocation(line: 64, column: 12, scope: !99)
!108 = !DILocation(line: 64, column: 10, scope: !99)
!109 = !DILocation(line: 65, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !99, file: !17, line: 65, column: 9)
!111 = !DILocation(line: 65, column: 14, scope: !110)
!112 = !DILocation(line: 65, column: 9, scope: !99)
!113 = !DILocation(line: 65, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 65, column: 23)
!115 = !DILocalVariable(name: "source", scope: !116, file: !17, line: 67, type: !37)
!116 = distinct !DILexicalBlock(scope: !99, file: !17, line: 66, column: 5)
!117 = !DILocation(line: 67, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !116, file: !17, line: 68, type: !42)
!119 = !DILocation(line: 68, column: 16, scope: !116)
!120 = !DILocalVariable(name: "sourceLen", scope: !116, file: !17, line: 68, type: !42)
!121 = !DILocation(line: 68, column: 19, scope: !116)
!122 = !DILocation(line: 69, column: 28, scope: !116)
!123 = !DILocation(line: 69, column: 21, scope: !116)
!124 = !DILocation(line: 69, column: 19, scope: !116)
!125 = !DILocation(line: 72, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !17, line: 72, column: 9)
!127 = !DILocation(line: 72, column: 14, scope: !126)
!128 = !DILocation(line: 72, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !17, line: 72, column: 9)
!130 = !DILocation(line: 72, column: 25, scope: !129)
!131 = !DILocation(line: 72, column: 35, scope: !129)
!132 = !DILocation(line: 72, column: 23, scope: !129)
!133 = !DILocation(line: 72, column: 9, scope: !126)
!134 = !DILocation(line: 74, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !17, line: 73, column: 9)
!136 = !DILocation(line: 74, column: 23, scope: !135)
!137 = !DILocation(line: 74, column: 13, scope: !135)
!138 = !DILocation(line: 74, column: 18, scope: !135)
!139 = !DILocation(line: 74, column: 21, scope: !135)
!140 = !DILocation(line: 75, column: 9, scope: !135)
!141 = !DILocation(line: 72, column: 41, scope: !129)
!142 = !DILocation(line: 72, column: 9, scope: !129)
!143 = distinct !{!143, !133, !144, !70}
!144 = !DILocation(line: 75, column: 9, scope: !126)
!145 = !DILocation(line: 76, column: 20, scope: !116)
!146 = !DILocation(line: 76, column: 9, scope: !116)
!147 = !DILocation(line: 77, column: 14, scope: !116)
!148 = !DILocation(line: 77, column: 9, scope: !116)
!149 = !DILocation(line: 79, column: 1, scope: !99)
