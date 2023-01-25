; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_badData, align 8, !dbg !37
  call void @badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #6, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #6, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_badData, align 8, !dbg !65
  store i8* %0, i8** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i64* %i, metadata !66, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !72, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !77
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !83
  %cmp = icmp ult i64 %1, 100, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !89
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %5 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !90
  store i8 %3, i8* %arrayidx2, align 1, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %6, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !99
  store i8 0, i8* %arrayidx3, align 1, !dbg !100
  %8 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %8), !dbg !102
  %9 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* %9) #6, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %2 = load i8*, i8** %data, align 8, !dbg !120
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_goodG2BData, align 8, !dbg !121
  call void @goodG2BSink(), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !124 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_goodG2BData, align 8, !dbg !127
  store i8* %0, i8** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !133
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !139
  %cmp = icmp ult i64 %1, 100, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !145
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !145
  %4 = load i8*, i8** %data, align 8, !dbg !146
  %5 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !146
  store i8 %3, i8* %arrayidx2, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %6, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !154
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !154
  store i8 0, i8* %arrayidx3, align 1, !dbg !155
  %8 = load i8*, i8** %data, align 8, !dbg !156
  call void @printLine(i8* %8), !dbg !157
  %9 = load i8*, i8** %data, align 8, !dbg !158
  call void @free(i8* %9) #6, !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_badData", scope: !2, file: !13, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_goodG2BData", scope: !2, file: !13, line: 22, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_bad", scope: !13, file: !13, line: 45, type: !21, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 47, type: !6)
!24 = !DILocation(line: 47, column: 12, scope: !20)
!25 = !DILocation(line: 48, column: 10, scope: !20)
!26 = !DILocation(line: 50, column: 20, scope: !20)
!27 = !DILocation(line: 50, column: 10, scope: !20)
!28 = !DILocation(line: 51, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 51, column: 9)
!30 = !DILocation(line: 51, column: 14, scope: !29)
!31 = !DILocation(line: 51, column: 9, scope: !20)
!32 = !DILocation(line: 51, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 51, column: 23)
!34 = !DILocation(line: 52, column: 5, scope: !20)
!35 = !DILocation(line: 52, column: 13, scope: !20)
!36 = !DILocation(line: 53, column: 72, scope: !20)
!37 = !DILocation(line: 53, column: 70, scope: !20)
!38 = !DILocation(line: 54, column: 5, scope: !20)
!39 = !DILocation(line: 55, column: 1, scope: !20)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_45_good", scope: !13, file: !13, line: 93, type: !21, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 95, column: 5, scope: !40)
!42 = !DILocation(line: 96, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 107, type: !44, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !13, line: 107, type: !46)
!49 = !DILocation(line: 107, column: 14, scope: !43)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !13, line: 107, type: !47)
!51 = !DILocation(line: 107, column: 27, scope: !43)
!52 = !DILocation(line: 110, column: 22, scope: !43)
!53 = !DILocation(line: 110, column: 12, scope: !43)
!54 = !DILocation(line: 110, column: 5, scope: !43)
!55 = !DILocation(line: 112, column: 5, scope: !43)
!56 = !DILocation(line: 113, column: 5, scope: !43)
!57 = !DILocation(line: 114, column: 5, scope: !43)
!58 = !DILocation(line: 117, column: 5, scope: !43)
!59 = !DILocation(line: 118, column: 5, scope: !43)
!60 = !DILocation(line: 119, column: 5, scope: !43)
!61 = !DILocation(line: 121, column: 5, scope: !43)
!62 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocalVariable(name: "data", scope: !62, file: !13, line: 28, type: !6)
!64 = !DILocation(line: 28, column: 12, scope: !62)
!65 = !DILocation(line: 28, column: 19, scope: !62)
!66 = !DILocalVariable(name: "i", scope: !67, file: !13, line: 30, type: !68)
!67 = distinct !DILexicalBlock(scope: !62, file: !13, line: 29, column: 5)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !69, line: 46, baseType: !70)
!69 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!70 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!71 = !DILocation(line: 30, column: 16, scope: !67)
!72 = !DILocalVariable(name: "source", scope: !67, file: !13, line: 31, type: !73)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 100)
!76 = !DILocation(line: 31, column: 14, scope: !67)
!77 = !DILocation(line: 32, column: 9, scope: !67)
!78 = !DILocation(line: 33, column: 9, scope: !67)
!79 = !DILocation(line: 33, column: 23, scope: !67)
!80 = !DILocation(line: 35, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !67, file: !13, line: 35, column: 9)
!82 = !DILocation(line: 35, column: 14, scope: !81)
!83 = !DILocation(line: 35, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !13, line: 35, column: 9)
!85 = !DILocation(line: 35, column: 23, scope: !84)
!86 = !DILocation(line: 35, column: 9, scope: !81)
!87 = !DILocation(line: 37, column: 30, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !13, line: 36, column: 9)
!89 = !DILocation(line: 37, column: 23, scope: !88)
!90 = !DILocation(line: 37, column: 13, scope: !88)
!91 = !DILocation(line: 37, column: 18, scope: !88)
!92 = !DILocation(line: 37, column: 21, scope: !88)
!93 = !DILocation(line: 38, column: 9, scope: !88)
!94 = !DILocation(line: 35, column: 31, scope: !84)
!95 = !DILocation(line: 35, column: 9, scope: !84)
!96 = distinct !{!96, !86, !97, !98}
!97 = !DILocation(line: 38, column: 9, scope: !81)
!98 = !{!"llvm.loop.mustprogress"}
!99 = !DILocation(line: 39, column: 9, scope: !67)
!100 = !DILocation(line: 39, column: 21, scope: !67)
!101 = !DILocation(line: 40, column: 19, scope: !67)
!102 = !DILocation(line: 40, column: 9, scope: !67)
!103 = !DILocation(line: 41, column: 14, scope: !67)
!104 = !DILocation(line: 41, column: 9, scope: !67)
!105 = !DILocation(line: 43, column: 1, scope: !62)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 81, type: !21, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !13, line: 83, type: !6)
!108 = !DILocation(line: 83, column: 12, scope: !106)
!109 = !DILocation(line: 84, column: 10, scope: !106)
!110 = !DILocation(line: 86, column: 20, scope: !106)
!111 = !DILocation(line: 86, column: 10, scope: !106)
!112 = !DILocation(line: 87, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !13, line: 87, column: 9)
!114 = !DILocation(line: 87, column: 14, scope: !113)
!115 = !DILocation(line: 87, column: 9, scope: !106)
!116 = !DILocation(line: 87, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !13, line: 87, column: 23)
!118 = !DILocation(line: 88, column: 5, scope: !106)
!119 = !DILocation(line: 88, column: 13, scope: !106)
!120 = !DILocation(line: 89, column: 76, scope: !106)
!121 = !DILocation(line: 89, column: 74, scope: !106)
!122 = !DILocation(line: 90, column: 5, scope: !106)
!123 = !DILocation(line: 91, column: 1, scope: !106)
!124 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 62, type: !21, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !13, line: 64, type: !6)
!126 = !DILocation(line: 64, column: 12, scope: !124)
!127 = !DILocation(line: 64, column: 19, scope: !124)
!128 = !DILocalVariable(name: "i", scope: !129, file: !13, line: 66, type: !68)
!129 = distinct !DILexicalBlock(scope: !124, file: !13, line: 65, column: 5)
!130 = !DILocation(line: 66, column: 16, scope: !129)
!131 = !DILocalVariable(name: "source", scope: !129, file: !13, line: 67, type: !73)
!132 = !DILocation(line: 67, column: 14, scope: !129)
!133 = !DILocation(line: 68, column: 9, scope: !129)
!134 = !DILocation(line: 69, column: 9, scope: !129)
!135 = !DILocation(line: 69, column: 23, scope: !129)
!136 = !DILocation(line: 71, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !129, file: !13, line: 71, column: 9)
!138 = !DILocation(line: 71, column: 14, scope: !137)
!139 = !DILocation(line: 71, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !13, line: 71, column: 9)
!141 = !DILocation(line: 71, column: 23, scope: !140)
!142 = !DILocation(line: 71, column: 9, scope: !137)
!143 = !DILocation(line: 73, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !13, line: 72, column: 9)
!145 = !DILocation(line: 73, column: 23, scope: !144)
!146 = !DILocation(line: 73, column: 13, scope: !144)
!147 = !DILocation(line: 73, column: 18, scope: !144)
!148 = !DILocation(line: 73, column: 21, scope: !144)
!149 = !DILocation(line: 74, column: 9, scope: !144)
!150 = !DILocation(line: 71, column: 31, scope: !140)
!151 = !DILocation(line: 71, column: 9, scope: !140)
!152 = distinct !{!152, !142, !153, !98}
!153 = !DILocation(line: 74, column: 9, scope: !137)
!154 = !DILocation(line: 75, column: 9, scope: !129)
!155 = !DILocation(line: 75, column: 21, scope: !129)
!156 = !DILocation(line: 76, column: 19, scope: !129)
!157 = !DILocation(line: 76, column: 9, scope: !129)
!158 = !DILocation(line: 77, column: 14, scope: !129)
!159 = !DILocation(line: 77, column: 9, scope: !129)
!160 = !DILocation(line: 79, column: 1, scope: !124)
