; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
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
  %call1 = call i32* @badSource(i32* %2), !dbg !32
  store i32* %call1, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !47
  store i64 %call2, i64* %dataLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !52
  %6 = load i64, i64* %dataLen, align 8, !dbg !54
  %cmp3 = icmp ult i64 %5, %6, !dbg !55
  br i1 %cmp3, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !57
  %8 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !57
  %9 = load i32, i32* %arrayidx, align 4, !dbg !57
  %10 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !61
  store i32 %9, i32* %arrayidx4, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %11, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !69
  store i32 0, i32* %arrayidx5, align 4, !dbg !70
  %12 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %12), !dbg !72
  %13 = load i32*, i32** %data, align 8, !dbg !73
  %14 = bitcast i32* %13 to i8*, !dbg !73
  call void @free(i8* %14) #7, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !76 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = load i32*, i32** %data.addr, align 8, !dbg !81
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !82
  %1 = load i32*, i32** %data.addr, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  %2 = load i32*, i32** %data.addr, align 8, !dbg !85
  ret i32* %2, !dbg !86
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #7, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #7, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !113
  %0 = bitcast i8* %call to i32*, !dbg !114
  store i32* %0, i32** %data, align 8, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %cmp = icmp eq i32* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %call1 = call i32* @goodG2BSource(i32* %2), !dbg !123
  store i32* %call1, i32** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !130, metadata !DIExpression()), !dbg !131
  %4 = load i32*, i32** %data, align 8, !dbg !132
  %call2 = call i64 @wcslen(i32* %4) #9, !dbg !133
  store i64 %call2, i64* %dataLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !138
  %6 = load i64, i64* %dataLen, align 8, !dbg !140
  %cmp3 = icmp ult i64 %5, %6, !dbg !141
  br i1 %cmp3, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !143
  %8 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !143
  %9 = load i32, i32* %arrayidx, align 4, !dbg !143
  %10 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !147
  store i32 %9, i32* %arrayidx4, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %11, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !154
  store i32 0, i32* %arrayidx5, align 4, !dbg !155
  %12 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %12), !dbg !157
  %13 = load i32*, i32** %data, align 8, !dbg !158
  %14 = bitcast i32* %13 to i8*, !dbg !158
  call void @free(i8* %14) #7, !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !161 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !162, metadata !DIExpression()), !dbg !163
  %0 = load i32*, i32** %data.addr, align 8, !dbg !164
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !165
  %1 = load i32*, i32** %data.addr, align 8, !dbg !166
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !166
  store i32 0, i32* %arrayidx, align 4, !dbg !167
  %2 = load i32*, i32** %data.addr, align 8, !dbg !168
  ret i32* %2, !dbg !169
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_bad", scope: !17, file: !17, line: 31, type: !18, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 33, type: !4)
!21 = !DILocation(line: 33, column: 15, scope: !16)
!22 = !DILocation(line: 34, column: 23, scope: !16)
!23 = !DILocation(line: 34, column: 12, scope: !16)
!24 = !DILocation(line: 34, column: 10, scope: !16)
!25 = !DILocation(line: 35, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 9)
!27 = !DILocation(line: 35, column: 14, scope: !26)
!28 = !DILocation(line: 35, column: 9, scope: !16)
!29 = !DILocation(line: 35, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 35, column: 23)
!31 = !DILocation(line: 36, column: 22, scope: !16)
!32 = !DILocation(line: 36, column: 12, scope: !16)
!33 = !DILocation(line: 36, column: 10, scope: !16)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !17, line: 38, type: !36)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 38, column: 17, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !17, line: 39, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 39, column: 16, scope: !35)
!44 = !DILocalVariable(name: "dataLen", scope: !35, file: !17, line: 39, type: !41)
!45 = !DILocation(line: 39, column: 19, scope: !35)
!46 = !DILocation(line: 40, column: 26, scope: !35)
!47 = !DILocation(line: 40, column: 19, scope: !35)
!48 = !DILocation(line: 40, column: 17, scope: !35)
!49 = !DILocation(line: 42, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !35, file: !17, line: 42, column: 9)
!51 = !DILocation(line: 42, column: 14, scope: !50)
!52 = !DILocation(line: 42, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !17, line: 42, column: 9)
!54 = !DILocation(line: 42, column: 25, scope: !53)
!55 = !DILocation(line: 42, column: 23, scope: !53)
!56 = !DILocation(line: 42, column: 9, scope: !50)
!57 = !DILocation(line: 44, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !17, line: 43, column: 9)
!59 = !DILocation(line: 44, column: 28, scope: !58)
!60 = !DILocation(line: 44, column: 18, scope: !58)
!61 = !DILocation(line: 44, column: 13, scope: !58)
!62 = !DILocation(line: 44, column: 21, scope: !58)
!63 = !DILocation(line: 45, column: 9, scope: !58)
!64 = !DILocation(line: 42, column: 35, scope: !53)
!65 = !DILocation(line: 42, column: 9, scope: !53)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 45, column: 9, scope: !50)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 46, column: 9, scope: !35)
!70 = !DILocation(line: 46, column: 20, scope: !35)
!71 = !DILocation(line: 47, column: 20, scope: !35)
!72 = !DILocation(line: 47, column: 9, scope: !35)
!73 = !DILocation(line: 48, column: 14, scope: !35)
!74 = !DILocation(line: 48, column: 9, scope: !35)
!75 = !DILocation(line: 50, column: 1, scope: !16)
!76 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !77, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!4, !4}
!79 = !DILocalVariable(name: "data", arg: 1, scope: !76, file: !17, line: 23, type: !4)
!80 = !DILocation(line: 23, column: 38, scope: !76)
!81 = !DILocation(line: 26, column: 13, scope: !76)
!82 = !DILocation(line: 26, column: 5, scope: !76)
!83 = !DILocation(line: 27, column: 5, scope: !76)
!84 = !DILocation(line: 27, column: 17, scope: !76)
!85 = !DILocation(line: 28, column: 12, scope: !76)
!86 = !DILocation(line: 28, column: 5, scope: !76)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_good", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 88, column: 5, scope: !87)
!89 = !DILocation(line: 89, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 101, type: !91, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!7, !7, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !17, line: 101, type: !7)
!97 = !DILocation(line: 101, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !17, line: 101, type: !93)
!99 = !DILocation(line: 101, column: 27, scope: !90)
!100 = !DILocation(line: 104, column: 22, scope: !90)
!101 = !DILocation(line: 104, column: 12, scope: !90)
!102 = !DILocation(line: 104, column: 5, scope: !90)
!103 = !DILocation(line: 106, column: 5, scope: !90)
!104 = !DILocation(line: 107, column: 5, scope: !90)
!105 = !DILocation(line: 108, column: 5, scope: !90)
!106 = !DILocation(line: 111, column: 5, scope: !90)
!107 = !DILocation(line: 112, column: 5, scope: !90)
!108 = !DILocation(line: 113, column: 5, scope: !90)
!109 = !DILocation(line: 115, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 65, type: !18, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !17, line: 67, type: !4)
!112 = !DILocation(line: 67, column: 15, scope: !110)
!113 = !DILocation(line: 68, column: 23, scope: !110)
!114 = !DILocation(line: 68, column: 12, scope: !110)
!115 = !DILocation(line: 68, column: 10, scope: !110)
!116 = !DILocation(line: 69, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !17, line: 69, column: 9)
!118 = !DILocation(line: 69, column: 14, scope: !117)
!119 = !DILocation(line: 69, column: 9, scope: !110)
!120 = !DILocation(line: 69, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 69, column: 23)
!122 = !DILocation(line: 70, column: 26, scope: !110)
!123 = !DILocation(line: 70, column: 12, scope: !110)
!124 = !DILocation(line: 70, column: 10, scope: !110)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !17, line: 72, type: !36)
!126 = distinct !DILexicalBlock(scope: !110, file: !17, line: 71, column: 5)
!127 = !DILocation(line: 72, column: 17, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !17, line: 73, type: !41)
!129 = !DILocation(line: 73, column: 16, scope: !126)
!130 = !DILocalVariable(name: "dataLen", scope: !126, file: !17, line: 73, type: !41)
!131 = !DILocation(line: 73, column: 19, scope: !126)
!132 = !DILocation(line: 74, column: 26, scope: !126)
!133 = !DILocation(line: 74, column: 19, scope: !126)
!134 = !DILocation(line: 74, column: 17, scope: !126)
!135 = !DILocation(line: 76, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !17, line: 76, column: 9)
!137 = !DILocation(line: 76, column: 14, scope: !136)
!138 = !DILocation(line: 76, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !17, line: 76, column: 9)
!140 = !DILocation(line: 76, column: 25, scope: !139)
!141 = !DILocation(line: 76, column: 23, scope: !139)
!142 = !DILocation(line: 76, column: 9, scope: !136)
!143 = !DILocation(line: 78, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !17, line: 77, column: 9)
!145 = !DILocation(line: 78, column: 28, scope: !144)
!146 = !DILocation(line: 78, column: 18, scope: !144)
!147 = !DILocation(line: 78, column: 13, scope: !144)
!148 = !DILocation(line: 78, column: 21, scope: !144)
!149 = !DILocation(line: 79, column: 9, scope: !144)
!150 = !DILocation(line: 76, column: 35, scope: !139)
!151 = !DILocation(line: 76, column: 9, scope: !139)
!152 = distinct !{!152, !142, !153, !68}
!153 = !DILocation(line: 79, column: 9, scope: !136)
!154 = !DILocation(line: 80, column: 9, scope: !126)
!155 = !DILocation(line: 80, column: 20, scope: !126)
!156 = !DILocation(line: 81, column: 20, scope: !126)
!157 = !DILocation(line: 81, column: 9, scope: !126)
!158 = !DILocation(line: 82, column: 14, scope: !126)
!159 = !DILocation(line: 82, column: 9, scope: !126)
!160 = !DILocation(line: 84, column: 1, scope: !110)
!161 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 56, type: !77, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DILocalVariable(name: "data", arg: 1, scope: !161, file: !17, line: 56, type: !4)
!163 = !DILocation(line: 56, column: 42, scope: !161)
!164 = !DILocation(line: 59, column: 13, scope: !161)
!165 = !DILocation(line: 59, column: 5, scope: !161)
!166 = !DILocation(line: 60, column: 5, scope: !161)
!167 = !DILocation(line: 60, column: 16, scope: !161)
!168 = !DILocation(line: 61, column: 12, scope: !161)
!169 = !DILocation(line: 61, column: 5, scope: !161)
