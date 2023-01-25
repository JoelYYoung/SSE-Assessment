; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !31, metadata !DIExpression()), !dbg !32
  %1 = load i8*, i8** %data.addr, align 8, !dbg !33
  %call = call i64 @strlen(i8* %1) #7, !dbg !34
  store i64 %call, i64* %dataLen, align 8, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !39
  %3 = load i64, i64* %dataLen, align 8, !dbg !41
  %cmp = icmp ult i64 %2, %3, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !44
  %5 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !44
  %6 = load i8, i8* %arrayidx, align 1, !dbg !44
  %7 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !48
  store i8 %6, i8* %arrayidx1, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %8, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !56
  store i8 0, i8* %arrayidx2, align 1, !dbg !57
  %9 = load i8*, i8** %data.addr, align 8, !dbg !58
  call void @printLine(i8* %9), !dbg !59
  %10 = load i8*, i8** %data.addr, align 8, !dbg !60
  call void @free(i8* %10) #8, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_bad() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !68
  store i8* %call, i8** %data, align 8, !dbg !69
  %0 = load i8*, i8** %data, align 8, !dbg !70
  %cmp = icmp eq i8* %0, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !77
  %2 = load i8*, i8** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  %3 = load i8*, i8** %data, align 8, !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_badSink(i8* %3), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_goodG2BSink(i8* %data) #0 !dbg !83 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !88
  call void @llvm.dbg.declare(metadata i64* %i, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !91, metadata !DIExpression()), !dbg !92
  %1 = load i8*, i8** %data.addr, align 8, !dbg !93
  %call = call i64 @strlen(i8* %1) #7, !dbg !94
  store i64 %call, i64* %dataLen, align 8, !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !99
  %3 = load i64, i64* %dataLen, align 8, !dbg !101
  %cmp = icmp ult i64 %2, %3, !dbg !102
  br i1 %cmp, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !104
  %5 = load i64, i64* %i, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !104
  %6 = load i8, i8* %arrayidx, align 1, !dbg !104
  %7 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !108
  store i8 %6, i8* %arrayidx1, align 1, !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !111
  %inc = add i64 %8, 1, !dbg !111
  store i64 %inc, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !115
  store i8 0, i8* %arrayidx2, align 1, !dbg !116
  %9 = load i8*, i8** %data.addr, align 8, !dbg !117
  call void @printLine(i8* %9), !dbg !118
  %10 = load i8*, i8** %data.addr, align 8, !dbg !119
  call void @free(i8* %10) #8, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_good() #0 !dbg !122 {
entry:
  call void @goodG2B(), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !125 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !130, metadata !DIExpression()), !dbg !131
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !132, metadata !DIExpression()), !dbg !133
  %call = call i64 @time(i64* null) #8, !dbg !134
  %conv = trunc i64 %call to i32, !dbg !135
  call void @srand(i32 %conv) #8, !dbg !136
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !137
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_good(), !dbg !138
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !139
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !140
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_bad(), !dbg !141
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !142
  ret i32 0, !dbg !143
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !144 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !145, metadata !DIExpression()), !dbg !146
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !147
  store i8* %call, i8** %data, align 8, !dbg !148
  %0 = load i8*, i8** %data, align 8, !dbg !149
  %cmp = icmp eq i8* %0, null, !dbg !151
  br i1 %cmp, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !153
  unreachable, !dbg !153

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !156
  %2 = load i8*, i8** %data, align 8, !dbg !157
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !157
  store i8 0, i8* %arrayidx, align 1, !dbg !158
  %3 = load i8*, i8** %data, align 8, !dbg !159
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_goodG2BSink(i8* %3), !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 78, scope: !14)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocalVariable(name: "i", scope: !21, file: !15, line: 27, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 46, baseType: !29)
!28 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 27, column: 16, scope: !21)
!31 = !DILocalVariable(name: "dataLen", scope: !21, file: !15, line: 27, type: !27)
!32 = !DILocation(line: 27, column: 19, scope: !21)
!33 = !DILocation(line: 28, column: 26, scope: !21)
!34 = !DILocation(line: 28, column: 19, scope: !21)
!35 = !DILocation(line: 28, column: 17, scope: !21)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !21, file: !15, line: 30, column: 9)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 30, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 30, column: 9)
!41 = !DILocation(line: 30, column: 25, scope: !40)
!42 = !DILocation(line: 30, column: 23, scope: !40)
!43 = !DILocation(line: 30, column: 9, scope: !37)
!44 = !DILocation(line: 32, column: 23, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !15, line: 31, column: 9)
!46 = !DILocation(line: 32, column: 28, scope: !45)
!47 = !DILocation(line: 32, column: 18, scope: !45)
!48 = !DILocation(line: 32, column: 13, scope: !45)
!49 = !DILocation(line: 32, column: 21, scope: !45)
!50 = !DILocation(line: 33, column: 9, scope: !45)
!51 = !DILocation(line: 30, column: 35, scope: !40)
!52 = !DILocation(line: 30, column: 9, scope: !40)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 33, column: 9, scope: !37)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 34, column: 9, scope: !21)
!57 = !DILocation(line: 34, column: 20, scope: !21)
!58 = !DILocation(line: 35, column: 19, scope: !21)
!59 = !DILocation(line: 35, column: 9, scope: !21)
!60 = !DILocation(line: 36, column: 14, scope: !21)
!61 = !DILocation(line: 36, column: 9, scope: !21)
!62 = !DILocation(line: 38, column: 1, scope: !14)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_bad", scope: !15, file: !15, line: 40, type: !64, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null}
!66 = !DILocalVariable(name: "data", scope: !63, file: !15, line: 42, type: !4)
!67 = !DILocation(line: 42, column: 12, scope: !63)
!68 = !DILocation(line: 43, column: 20, scope: !63)
!69 = !DILocation(line: 43, column: 10, scope: !63)
!70 = !DILocation(line: 44, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !63, file: !15, line: 44, column: 9)
!72 = !DILocation(line: 44, column: 14, scope: !71)
!73 = !DILocation(line: 44, column: 9, scope: !63)
!74 = !DILocation(line: 44, column: 24, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 44, column: 23)
!76 = !DILocation(line: 46, column: 12, scope: !63)
!77 = !DILocation(line: 46, column: 5, scope: !63)
!78 = !DILocation(line: 47, column: 5, scope: !63)
!79 = !DILocation(line: 47, column: 17, scope: !63)
!80 = !DILocation(line: 48, column: 70, scope: !63)
!81 = !DILocation(line: 48, column: 5, scope: !63)
!82 = !DILocation(line: 49, column: 1, scope: !63)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_goodG2BSink", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", arg: 1, scope: !83, file: !15, line: 55, type: !4)
!85 = !DILocation(line: 55, column: 82, scope: !83)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !15, line: 58, type: !22)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 57, column: 5)
!88 = !DILocation(line: 58, column: 14, scope: !87)
!89 = !DILocalVariable(name: "i", scope: !87, file: !15, line: 59, type: !27)
!90 = !DILocation(line: 59, column: 16, scope: !87)
!91 = !DILocalVariable(name: "dataLen", scope: !87, file: !15, line: 59, type: !27)
!92 = !DILocation(line: 59, column: 19, scope: !87)
!93 = !DILocation(line: 60, column: 26, scope: !87)
!94 = !DILocation(line: 60, column: 19, scope: !87)
!95 = !DILocation(line: 60, column: 17, scope: !87)
!96 = !DILocation(line: 62, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !87, file: !15, line: 62, column: 9)
!98 = !DILocation(line: 62, column: 14, scope: !97)
!99 = !DILocation(line: 62, column: 21, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !15, line: 62, column: 9)
!101 = !DILocation(line: 62, column: 25, scope: !100)
!102 = !DILocation(line: 62, column: 23, scope: !100)
!103 = !DILocation(line: 62, column: 9, scope: !97)
!104 = !DILocation(line: 64, column: 23, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !15, line: 63, column: 9)
!106 = !DILocation(line: 64, column: 28, scope: !105)
!107 = !DILocation(line: 64, column: 18, scope: !105)
!108 = !DILocation(line: 64, column: 13, scope: !105)
!109 = !DILocation(line: 64, column: 21, scope: !105)
!110 = !DILocation(line: 65, column: 9, scope: !105)
!111 = !DILocation(line: 62, column: 35, scope: !100)
!112 = !DILocation(line: 62, column: 9, scope: !100)
!113 = distinct !{!113, !103, !114, !55}
!114 = !DILocation(line: 65, column: 9, scope: !97)
!115 = !DILocation(line: 66, column: 9, scope: !87)
!116 = !DILocation(line: 66, column: 20, scope: !87)
!117 = !DILocation(line: 67, column: 19, scope: !87)
!118 = !DILocation(line: 67, column: 9, scope: !87)
!119 = !DILocation(line: 68, column: 14, scope: !87)
!120 = !DILocation(line: 68, column: 9, scope: !87)
!121 = !DILocation(line: 70, column: 1, scope: !83)
!122 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_good", scope: !15, file: !15, line: 84, type: !64, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocation(line: 86, column: 5, scope: !122)
!124 = !DILocation(line: 87, column: 1, scope: !122)
!125 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !126, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DISubroutineType(types: !127)
!127 = !{!128, !128, !129}
!128 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!130 = !DILocalVariable(name: "argc", arg: 1, scope: !125, file: !15, line: 99, type: !128)
!131 = !DILocation(line: 99, column: 14, scope: !125)
!132 = !DILocalVariable(name: "argv", arg: 2, scope: !125, file: !15, line: 99, type: !129)
!133 = !DILocation(line: 99, column: 27, scope: !125)
!134 = !DILocation(line: 102, column: 22, scope: !125)
!135 = !DILocation(line: 102, column: 12, scope: !125)
!136 = !DILocation(line: 102, column: 5, scope: !125)
!137 = !DILocation(line: 104, column: 5, scope: !125)
!138 = !DILocation(line: 105, column: 5, scope: !125)
!139 = !DILocation(line: 106, column: 5, scope: !125)
!140 = !DILocation(line: 109, column: 5, scope: !125)
!141 = !DILocation(line: 110, column: 5, scope: !125)
!142 = !DILocation(line: 111, column: 5, scope: !125)
!143 = !DILocation(line: 113, column: 5, scope: !125)
!144 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 73, type: !64, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!145 = !DILocalVariable(name: "data", scope: !144, file: !15, line: 75, type: !4)
!146 = !DILocation(line: 75, column: 12, scope: !144)
!147 = !DILocation(line: 76, column: 20, scope: !144)
!148 = !DILocation(line: 76, column: 10, scope: !144)
!149 = !DILocation(line: 77, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !15, line: 77, column: 9)
!151 = !DILocation(line: 77, column: 14, scope: !150)
!152 = !DILocation(line: 77, column: 9, scope: !144)
!153 = !DILocation(line: 77, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 77, column: 23)
!155 = !DILocation(line: 79, column: 12, scope: !144)
!156 = !DILocation(line: 79, column: 5, scope: !144)
!157 = !DILocation(line: 80, column: 5, scope: !144)
!158 = !DILocation(line: 80, column: 16, scope: !144)
!159 = !DILocation(line: 81, column: 74, scope: !144)
!160 = !DILocation(line: 81, column: 5, scope: !144)
!161 = !DILocation(line: 82, column: 1, scope: !144)
