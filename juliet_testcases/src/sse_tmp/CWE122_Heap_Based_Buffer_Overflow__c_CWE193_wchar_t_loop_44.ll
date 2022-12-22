; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  call void %2(i32* %3), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !55
  %call = call i64 @wcslen(i32* %arraydecay) #9, !dbg !56
  store i64 %call, i64* %sourceLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !61
  %2 = load i64, i64* %sourceLen, align 8, !dbg !63
  %add = add i64 %2, 1, !dbg !64
  %cmp = icmp ult i64 %1, %add, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !69
  %4 = load i32, i32* %arrayidx, align 4, !dbg !69
  %5 = load i32*, i32** %data.addr, align 8, !dbg !70
  %6 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !70
  store i32 %4, i32* %arrayidx1, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %7, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !79
  call void @printWLine(i32* %8), !dbg !80
  %9 = load i32*, i32** %data.addr, align 8, !dbg !81
  %10 = bitcast i32* %9 to i8*, !dbg !81
  call void @free(i8* %10) #7, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !110, metadata !DIExpression()), !dbg !111
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !111
  store i32* null, i32** %data, align 8, !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !113
  %0 = bitcast i8* %call to i32*, !dbg !114
  store i32* %0, i32** %data, align 8, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %cmp = icmp eq i32* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !122
  %3 = load i32*, i32** %data, align 8, !dbg !123
  call void %2(i32* %3), !dbg !122
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !125 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %call = call i64 @wcslen(i32* %arraydecay) #9, !dbg !136
  store i64 %call, i64* %sourceLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !141
  %2 = load i64, i64* %sourceLen, align 8, !dbg !143
  %add = add i64 %2, 1, !dbg !144
  %cmp = icmp ult i64 %1, %add, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !149
  %4 = load i32, i32* %arrayidx, align 4, !dbg !149
  %5 = load i32*, i32** %data.addr, align 8, !dbg !150
  %6 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !150
  store i32 %4, i32* %arrayidx1, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %7, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !158
  call void @printWLine(i32* %8), !dbg !159
  %9 = load i32*, i32** %data.addr, align 8, !dbg !160
  %10 = bitcast i32* %9 to i8*, !dbg !160
  call void @free(i8* %10) #7, !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44_bad", scope: !17, file: !17, line: 45, type: !18, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 47, type: !4)
!21 = !DILocation(line: 47, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 49, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 49, column: 12, scope: !16)
!27 = !DILocation(line: 50, column: 10, scope: !16)
!28 = !DILocation(line: 52, column: 23, scope: !16)
!29 = !DILocation(line: 52, column: 12, scope: !16)
!30 = !DILocation(line: 52, column: 10, scope: !16)
!31 = !DILocation(line: 53, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 53, column: 9)
!33 = !DILocation(line: 53, column: 14, scope: !32)
!34 = !DILocation(line: 53, column: 9, scope: !16)
!35 = !DILocation(line: 53, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 53, column: 23)
!37 = !DILocation(line: 55, column: 5, scope: !16)
!38 = !DILocation(line: 55, column: 13, scope: !16)
!39 = !DILocation(line: 56, column: 1, scope: !16)
!40 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 28, type: !24, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !17, line: 28, type: !4)
!42 = !DILocation(line: 28, column: 31, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !17, line: 31, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 30, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 31, column: 17, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !17, line: 32, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 32, column: 16, scope: !44)
!53 = !DILocalVariable(name: "sourceLen", scope: !44, file: !17, line: 32, type: !50)
!54 = !DILocation(line: 32, column: 19, scope: !44)
!55 = !DILocation(line: 33, column: 28, scope: !44)
!56 = !DILocation(line: 33, column: 21, scope: !44)
!57 = !DILocation(line: 33, column: 19, scope: !44)
!58 = !DILocation(line: 36, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !44, file: !17, line: 36, column: 9)
!60 = !DILocation(line: 36, column: 14, scope: !59)
!61 = !DILocation(line: 36, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !17, line: 36, column: 9)
!63 = !DILocation(line: 36, column: 25, scope: !62)
!64 = !DILocation(line: 36, column: 35, scope: !62)
!65 = !DILocation(line: 36, column: 23, scope: !62)
!66 = !DILocation(line: 36, column: 9, scope: !59)
!67 = !DILocation(line: 38, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !17, line: 37, column: 9)
!69 = !DILocation(line: 38, column: 23, scope: !68)
!70 = !DILocation(line: 38, column: 13, scope: !68)
!71 = !DILocation(line: 38, column: 18, scope: !68)
!72 = !DILocation(line: 38, column: 21, scope: !68)
!73 = !DILocation(line: 39, column: 9, scope: !68)
!74 = !DILocation(line: 36, column: 41, scope: !62)
!75 = !DILocation(line: 36, column: 9, scope: !62)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 39, column: 9, scope: !59)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 40, column: 20, scope: !44)
!80 = !DILocation(line: 40, column: 9, scope: !44)
!81 = !DILocation(line: 41, column: 14, scope: !44)
!82 = !DILocation(line: 41, column: 9, scope: !44)
!83 = !DILocation(line: 43, column: 1, scope: !40)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_44_good", scope: !17, file: !17, line: 91, type: !18, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 93, column: 5, scope: !84)
!86 = !DILocation(line: 94, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 105, type: !88, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!7, !7, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !17, line: 105, type: !7)
!94 = !DILocation(line: 105, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !17, line: 105, type: !90)
!96 = !DILocation(line: 105, column: 27, scope: !87)
!97 = !DILocation(line: 108, column: 22, scope: !87)
!98 = !DILocation(line: 108, column: 12, scope: !87)
!99 = !DILocation(line: 108, column: 5, scope: !87)
!100 = !DILocation(line: 110, column: 5, scope: !87)
!101 = !DILocation(line: 111, column: 5, scope: !87)
!102 = !DILocation(line: 112, column: 5, scope: !87)
!103 = !DILocation(line: 115, column: 5, scope: !87)
!104 = !DILocation(line: 116, column: 5, scope: !87)
!105 = !DILocation(line: 117, column: 5, scope: !87)
!106 = !DILocation(line: 119, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !17, line: 82, type: !4)
!109 = !DILocation(line: 82, column: 15, scope: !107)
!110 = !DILocalVariable(name: "funcPtr", scope: !107, file: !17, line: 83, type: !23)
!111 = !DILocation(line: 83, column: 12, scope: !107)
!112 = !DILocation(line: 84, column: 10, scope: !107)
!113 = !DILocation(line: 86, column: 23, scope: !107)
!114 = !DILocation(line: 86, column: 12, scope: !107)
!115 = !DILocation(line: 86, column: 10, scope: !107)
!116 = !DILocation(line: 87, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !17, line: 87, column: 9)
!118 = !DILocation(line: 87, column: 14, scope: !117)
!119 = !DILocation(line: 87, column: 9, scope: !107)
!120 = !DILocation(line: 87, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 87, column: 23)
!122 = !DILocation(line: 88, column: 5, scope: !107)
!123 = !DILocation(line: 88, column: 13, scope: !107)
!124 = !DILocation(line: 89, column: 1, scope: !107)
!125 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 63, type: !24, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", arg: 1, scope: !125, file: !17, line: 63, type: !4)
!127 = !DILocation(line: 63, column: 35, scope: !125)
!128 = !DILocalVariable(name: "source", scope: !129, file: !17, line: 66, type: !45)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 65, column: 5)
!130 = !DILocation(line: 66, column: 17, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !17, line: 67, type: !50)
!132 = !DILocation(line: 67, column: 16, scope: !129)
!133 = !DILocalVariable(name: "sourceLen", scope: !129, file: !17, line: 67, type: !50)
!134 = !DILocation(line: 67, column: 19, scope: !129)
!135 = !DILocation(line: 68, column: 28, scope: !129)
!136 = !DILocation(line: 68, column: 21, scope: !129)
!137 = !DILocation(line: 68, column: 19, scope: !129)
!138 = !DILocation(line: 71, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !17, line: 71, column: 9)
!140 = !DILocation(line: 71, column: 14, scope: !139)
!141 = !DILocation(line: 71, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !17, line: 71, column: 9)
!143 = !DILocation(line: 71, column: 25, scope: !142)
!144 = !DILocation(line: 71, column: 35, scope: !142)
!145 = !DILocation(line: 71, column: 23, scope: !142)
!146 = !DILocation(line: 71, column: 9, scope: !139)
!147 = !DILocation(line: 73, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !17, line: 72, column: 9)
!149 = !DILocation(line: 73, column: 23, scope: !148)
!150 = !DILocation(line: 73, column: 13, scope: !148)
!151 = !DILocation(line: 73, column: 18, scope: !148)
!152 = !DILocation(line: 73, column: 21, scope: !148)
!153 = !DILocation(line: 74, column: 9, scope: !148)
!154 = !DILocation(line: 71, column: 41, scope: !142)
!155 = !DILocation(line: 71, column: 9, scope: !142)
!156 = distinct !{!156, !146, !157, !78}
!157 = !DILocation(line: 74, column: 9, scope: !139)
!158 = !DILocation(line: 75, column: 20, scope: !129)
!159 = !DILocation(line: 75, column: 9, scope: !129)
!160 = !DILocation(line: 76, column: 14, scope: !129)
!161 = !DILocation(line: 76, column: 9, scope: !129)
!162 = !DILocation(line: 78, column: 1, scope: !125)
