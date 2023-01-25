; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  store i8* %3, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #7, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #7, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_badData, align 8, !dbg !66
  store i8* %0, i8** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !67, metadata !DIExpression()), !dbg !72
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = load i8*, i8** %data, align 8, !dbg !80
  %call = call i64 @strlen(i8* %2) #9, !dbg !81
  store i64 %call, i64* %dataLen, align 8, !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !86
  %4 = load i64, i64* %dataLen, align 8, !dbg !88
  %cmp = icmp ult i64 %3, %4, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !91
  %6 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !91
  %7 = load i8, i8* %arrayidx, align 1, !dbg !91
  %8 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !95
  store i8 %7, i8* %arrayidx1, align 1, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %9, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !103
  store i8 0, i8* %arrayidx2, align 1, !dbg !104
  %10 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %10), !dbg !106
  %11 = load i8*, i8** %data, align 8, !dbg !107
  call void @free(i8* %11) #7, !dbg !108
  ret void, !dbg !109
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !113
  store i8* %call, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %cmp = icmp eq i8* %0, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !122
  %2 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  %3 = load i8*, i8** %data, align 8, !dbg !125
  store i8* %3, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_goodG2BData, align 8, !dbg !126
  call void @goodG2BSink(), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !129 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_goodG2BData, align 8, !dbg !132
  store i8* %0, i8** %data, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !138, metadata !DIExpression()), !dbg !139
  %2 = load i8*, i8** %data, align 8, !dbg !140
  %call = call i64 @strlen(i8* %2) #9, !dbg !141
  store i64 %call, i64* %dataLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !146
  %4 = load i64, i64* %dataLen, align 8, !dbg !148
  %cmp = icmp ult i64 %3, %4, !dbg !149
  br i1 %cmp, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !151
  %6 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !151
  %7 = load i8, i8* %arrayidx, align 1, !dbg !151
  %8 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !155
  store i8 %7, i8* %arrayidx1, align 1, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %9, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !162
  store i8 0, i8* %arrayidx2, align 1, !dbg !163
  %10 = load i8*, i8** %data, align 8, !dbg !164
  call void @printLine(i8* %10), !dbg !165
  %11 = load i8*, i8** %data, align 8, !dbg !166
  call void @free(i8* %11) #7, !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_badData", scope: !2, file: !13, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_goodG2BData", scope: !2, file: !13, line: 22, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_bad", scope: !13, file: !13, line: 44, type: !21, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 46, type: !6)
!24 = !DILocation(line: 46, column: 12, scope: !20)
!25 = !DILocation(line: 47, column: 20, scope: !20)
!26 = !DILocation(line: 47, column: 10, scope: !20)
!27 = !DILocation(line: 48, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !13, line: 48, column: 9)
!29 = !DILocation(line: 48, column: 14, scope: !28)
!30 = !DILocation(line: 48, column: 9, scope: !20)
!31 = !DILocation(line: 48, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !13, line: 48, column: 23)
!33 = !DILocation(line: 50, column: 12, scope: !20)
!34 = !DILocation(line: 50, column: 5, scope: !20)
!35 = !DILocation(line: 51, column: 5, scope: !20)
!36 = !DILocation(line: 51, column: 17, scope: !20)
!37 = !DILocation(line: 52, column: 72, scope: !20)
!38 = !DILocation(line: 52, column: 70, scope: !20)
!39 = !DILocation(line: 53, column: 5, scope: !20)
!40 = !DILocation(line: 54, column: 1, scope: !20)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_good", scope: !13, file: !13, line: 91, type: !21, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 93, column: 5, scope: !41)
!43 = !DILocation(line: 94, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 105, type: !45, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !13, line: 105, type: !47)
!50 = !DILocation(line: 105, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !13, line: 105, type: !48)
!52 = !DILocation(line: 105, column: 27, scope: !44)
!53 = !DILocation(line: 108, column: 22, scope: !44)
!54 = !DILocation(line: 108, column: 12, scope: !44)
!55 = !DILocation(line: 108, column: 5, scope: !44)
!56 = !DILocation(line: 110, column: 5, scope: !44)
!57 = !DILocation(line: 111, column: 5, scope: !44)
!58 = !DILocation(line: 112, column: 5, scope: !44)
!59 = !DILocation(line: 115, column: 5, scope: !44)
!60 = !DILocation(line: 116, column: 5, scope: !44)
!61 = !DILocation(line: 117, column: 5, scope: !44)
!62 = !DILocation(line: 119, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocalVariable(name: "data", scope: !63, file: !13, line: 28, type: !6)
!65 = !DILocation(line: 28, column: 12, scope: !63)
!66 = !DILocation(line: 28, column: 19, scope: !63)
!67 = !DILocalVariable(name: "dest", scope: !68, file: !13, line: 30, type: !69)
!68 = distinct !DILexicalBlock(scope: !63, file: !13, line: 29, column: 5)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 50)
!72 = !DILocation(line: 30, column: 14, scope: !68)
!73 = !DILocalVariable(name: "i", scope: !68, file: !13, line: 31, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !75, line: 46, baseType: !76)
!75 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!76 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!77 = !DILocation(line: 31, column: 16, scope: !68)
!78 = !DILocalVariable(name: "dataLen", scope: !68, file: !13, line: 31, type: !74)
!79 = !DILocation(line: 31, column: 19, scope: !68)
!80 = !DILocation(line: 32, column: 26, scope: !68)
!81 = !DILocation(line: 32, column: 19, scope: !68)
!82 = !DILocation(line: 32, column: 17, scope: !68)
!83 = !DILocation(line: 34, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !68, file: !13, line: 34, column: 9)
!85 = !DILocation(line: 34, column: 14, scope: !84)
!86 = !DILocation(line: 34, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !13, line: 34, column: 9)
!88 = !DILocation(line: 34, column: 25, scope: !87)
!89 = !DILocation(line: 34, column: 23, scope: !87)
!90 = !DILocation(line: 34, column: 9, scope: !84)
!91 = !DILocation(line: 36, column: 23, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !13, line: 35, column: 9)
!93 = !DILocation(line: 36, column: 28, scope: !92)
!94 = !DILocation(line: 36, column: 18, scope: !92)
!95 = !DILocation(line: 36, column: 13, scope: !92)
!96 = !DILocation(line: 36, column: 21, scope: !92)
!97 = !DILocation(line: 37, column: 9, scope: !92)
!98 = !DILocation(line: 34, column: 35, scope: !87)
!99 = !DILocation(line: 34, column: 9, scope: !87)
!100 = distinct !{!100, !90, !101, !102}
!101 = !DILocation(line: 37, column: 9, scope: !84)
!102 = !{!"llvm.loop.mustprogress"}
!103 = !DILocation(line: 38, column: 9, scope: !68)
!104 = !DILocation(line: 38, column: 20, scope: !68)
!105 = !DILocation(line: 39, column: 19, scope: !68)
!106 = !DILocation(line: 39, column: 9, scope: !68)
!107 = !DILocation(line: 40, column: 14, scope: !68)
!108 = !DILocation(line: 40, column: 9, scope: !68)
!109 = !DILocation(line: 42, column: 1, scope: !63)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 79, type: !21, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !13, line: 81, type: !6)
!112 = !DILocation(line: 81, column: 12, scope: !110)
!113 = !DILocation(line: 82, column: 20, scope: !110)
!114 = !DILocation(line: 82, column: 10, scope: !110)
!115 = !DILocation(line: 83, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !13, line: 83, column: 9)
!117 = !DILocation(line: 83, column: 14, scope: !116)
!118 = !DILocation(line: 83, column: 9, scope: !110)
!119 = !DILocation(line: 83, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !13, line: 83, column: 23)
!121 = !DILocation(line: 85, column: 12, scope: !110)
!122 = !DILocation(line: 85, column: 5, scope: !110)
!123 = !DILocation(line: 86, column: 5, scope: !110)
!124 = !DILocation(line: 86, column: 16, scope: !110)
!125 = !DILocation(line: 87, column: 76, scope: !110)
!126 = !DILocation(line: 87, column: 74, scope: !110)
!127 = !DILocation(line: 88, column: 5, scope: !110)
!128 = !DILocation(line: 89, column: 1, scope: !110)
!129 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!130 = !DILocalVariable(name: "data", scope: !129, file: !13, line: 63, type: !6)
!131 = !DILocation(line: 63, column: 12, scope: !129)
!132 = !DILocation(line: 63, column: 19, scope: !129)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !13, line: 65, type: !69)
!134 = distinct !DILexicalBlock(scope: !129, file: !13, line: 64, column: 5)
!135 = !DILocation(line: 65, column: 14, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !134, file: !13, line: 66, type: !74)
!137 = !DILocation(line: 66, column: 16, scope: !134)
!138 = !DILocalVariable(name: "dataLen", scope: !134, file: !13, line: 66, type: !74)
!139 = !DILocation(line: 66, column: 19, scope: !134)
!140 = !DILocation(line: 67, column: 26, scope: !134)
!141 = !DILocation(line: 67, column: 19, scope: !134)
!142 = !DILocation(line: 67, column: 17, scope: !134)
!143 = !DILocation(line: 69, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !13, line: 69, column: 9)
!145 = !DILocation(line: 69, column: 14, scope: !144)
!146 = !DILocation(line: 69, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !13, line: 69, column: 9)
!148 = !DILocation(line: 69, column: 25, scope: !147)
!149 = !DILocation(line: 69, column: 23, scope: !147)
!150 = !DILocation(line: 69, column: 9, scope: !144)
!151 = !DILocation(line: 71, column: 23, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !13, line: 70, column: 9)
!153 = !DILocation(line: 71, column: 28, scope: !152)
!154 = !DILocation(line: 71, column: 18, scope: !152)
!155 = !DILocation(line: 71, column: 13, scope: !152)
!156 = !DILocation(line: 71, column: 21, scope: !152)
!157 = !DILocation(line: 72, column: 9, scope: !152)
!158 = !DILocation(line: 69, column: 35, scope: !147)
!159 = !DILocation(line: 69, column: 9, scope: !147)
!160 = distinct !{!160, !150, !161, !102}
!161 = !DILocation(line: 72, column: 9, scope: !144)
!162 = !DILocation(line: 73, column: 9, scope: !134)
!163 = !DILocation(line: 73, column: 20, scope: !134)
!164 = !DILocation(line: 74, column: 19, scope: !134)
!165 = !DILocation(line: 74, column: 9, scope: !134)
!166 = !DILocation(line: 75, column: 14, scope: !134)
!167 = !DILocation(line: 75, column: 9, scope: !134)
!168 = !DILocation(line: 77, column: 1, scope: !129)
