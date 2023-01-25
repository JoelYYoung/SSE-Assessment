; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %3, i8** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !38
  store i8* %4, i8** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !50, metadata !DIExpression()), !dbg !51
  %6 = load i8*, i8** %data1, align 8, !dbg !52
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !53
  store i64 %call2, i64* %dataLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !58
  %8 = load i64, i64* %dataLen, align 8, !dbg !60
  %cmp3 = icmp ult i64 %7, %8, !dbg !61
  br i1 %cmp3, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data1, align 8, !dbg !63
  %10 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !63
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !63
  %12 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !67
  store i8 %11, i8* %arrayidx5, align 1, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %13, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !75
  store i8 0, i8* %arrayidx6, align 1, !dbg !76
  %14 = load i8*, i8** %data1, align 8, !dbg !77
  call void @printLine(i8* %14), !dbg !78
  %15 = load i8*, i8** %data1, align 8, !dbg !79
  call void @free(i8* %15) #7, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !107
  store i8* %call, i8** %data, align 8, !dbg !108
  %0 = load i8*, i8** %data, align 8, !dbg !109
  %cmp = icmp eq i8* %0, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !116
  %2 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !119, metadata !DIExpression()), !dbg !121
  %3 = load i8*, i8** %data, align 8, !dbg !122
  store i8* %3, i8** %dataCopy, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !123, metadata !DIExpression()), !dbg !124
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !125
  store i8* %4, i8** %data1, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !131, metadata !DIExpression()), !dbg !132
  %6 = load i8*, i8** %data1, align 8, !dbg !133
  %call2 = call i64 @strlen(i8* %6) #9, !dbg !134
  store i64 %call2, i64* %dataLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !139
  %8 = load i64, i64* %dataLen, align 8, !dbg !141
  %cmp3 = icmp ult i64 %7, %8, !dbg !142
  br i1 %cmp3, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data1, align 8, !dbg !144
  %10 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !144
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !144
  %12 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !148
  store i8 %11, i8* %arrayidx5, align 1, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %13, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !155
  store i8 0, i8* %arrayidx6, align 1, !dbg !156
  %14 = load i8*, i8** %data1, align 8, !dbg !157
  call void @printLine(i8* %14), !dbg !158
  %15 = load i8*, i8** %data1, align 8, !dbg !159
  call void @free(i8* %15) #7, !dbg !160
  ret void, !dbg !161
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
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 29, column: 12, scope: !14)
!29 = !DILocation(line: 29, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 30, column: 17, scope: !14)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !15, line: 32, type: !4)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 16, scope: !33)
!35 = !DILocation(line: 32, column: 27, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 33, type: !4)
!37 = !DILocation(line: 33, column: 16, scope: !33)
!38 = !DILocation(line: 33, column: 23, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !15, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !15, line: 34, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 35, column: 18, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !15, line: 36, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 36, column: 20, scope: !40)
!50 = !DILocalVariable(name: "dataLen", scope: !40, file: !15, line: 36, type: !46)
!51 = !DILocation(line: 36, column: 23, scope: !40)
!52 = !DILocation(line: 37, column: 30, scope: !40)
!53 = !DILocation(line: 37, column: 23, scope: !40)
!54 = !DILocation(line: 37, column: 21, scope: !40)
!55 = !DILocation(line: 39, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !15, line: 39, column: 13)
!57 = !DILocation(line: 39, column: 18, scope: !56)
!58 = !DILocation(line: 39, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !15, line: 39, column: 13)
!60 = !DILocation(line: 39, column: 29, scope: !59)
!61 = !DILocation(line: 39, column: 27, scope: !59)
!62 = !DILocation(line: 39, column: 13, scope: !56)
!63 = !DILocation(line: 41, column: 27, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !15, line: 40, column: 13)
!65 = !DILocation(line: 41, column: 32, scope: !64)
!66 = !DILocation(line: 41, column: 22, scope: !64)
!67 = !DILocation(line: 41, column: 17, scope: !64)
!68 = !DILocation(line: 41, column: 25, scope: !64)
!69 = !DILocation(line: 42, column: 13, scope: !64)
!70 = !DILocation(line: 39, column: 39, scope: !59)
!71 = !DILocation(line: 39, column: 13, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 42, column: 13, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 43, column: 13, scope: !40)
!76 = !DILocation(line: 43, column: 24, scope: !40)
!77 = !DILocation(line: 44, column: 23, scope: !40)
!78 = !DILocation(line: 44, column: 13, scope: !40)
!79 = !DILocation(line: 45, column: 18, scope: !40)
!80 = !DILocation(line: 45, column: 13, scope: !40)
!81 = !DILocation(line: 48, column: 1, scope: !14)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_31_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 84, column: 5, scope: !82)
!84 = !DILocation(line: 85, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !86, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 96, type: !88)
!91 = !DILocation(line: 96, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 96, type: !89)
!93 = !DILocation(line: 96, column: 27, scope: !85)
!94 = !DILocation(line: 99, column: 22, scope: !85)
!95 = !DILocation(line: 99, column: 12, scope: !85)
!96 = !DILocation(line: 99, column: 5, scope: !85)
!97 = !DILocation(line: 101, column: 5, scope: !85)
!98 = !DILocation(line: 102, column: 5, scope: !85)
!99 = !DILocation(line: 103, column: 5, scope: !85)
!100 = !DILocation(line: 106, column: 5, scope: !85)
!101 = !DILocation(line: 107, column: 5, scope: !85)
!102 = !DILocation(line: 108, column: 5, scope: !85)
!103 = !DILocation(line: 110, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 57, type: !4)
!106 = !DILocation(line: 57, column: 12, scope: !104)
!107 = !DILocation(line: 58, column: 20, scope: !104)
!108 = !DILocation(line: 58, column: 10, scope: !104)
!109 = !DILocation(line: 59, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !15, line: 59, column: 9)
!111 = !DILocation(line: 59, column: 14, scope: !110)
!112 = !DILocation(line: 59, column: 9, scope: !104)
!113 = !DILocation(line: 59, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 59, column: 23)
!115 = !DILocation(line: 61, column: 12, scope: !104)
!116 = !DILocation(line: 61, column: 5, scope: !104)
!117 = !DILocation(line: 62, column: 5, scope: !104)
!118 = !DILocation(line: 62, column: 16, scope: !104)
!119 = !DILocalVariable(name: "dataCopy", scope: !120, file: !15, line: 64, type: !4)
!120 = distinct !DILexicalBlock(scope: !104, file: !15, line: 63, column: 5)
!121 = !DILocation(line: 64, column: 16, scope: !120)
!122 = !DILocation(line: 64, column: 27, scope: !120)
!123 = !DILocalVariable(name: "data", scope: !120, file: !15, line: 65, type: !4)
!124 = !DILocation(line: 65, column: 16, scope: !120)
!125 = !DILocation(line: 65, column: 23, scope: !120)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !15, line: 67, type: !41)
!127 = distinct !DILexicalBlock(scope: !120, file: !15, line: 66, column: 9)
!128 = !DILocation(line: 67, column: 18, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !15, line: 68, type: !46)
!130 = !DILocation(line: 68, column: 20, scope: !127)
!131 = !DILocalVariable(name: "dataLen", scope: !127, file: !15, line: 68, type: !46)
!132 = !DILocation(line: 68, column: 23, scope: !127)
!133 = !DILocation(line: 69, column: 30, scope: !127)
!134 = !DILocation(line: 69, column: 23, scope: !127)
!135 = !DILocation(line: 69, column: 21, scope: !127)
!136 = !DILocation(line: 71, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !15, line: 71, column: 13)
!138 = !DILocation(line: 71, column: 18, scope: !137)
!139 = !DILocation(line: 71, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 71, column: 13)
!141 = !DILocation(line: 71, column: 29, scope: !140)
!142 = !DILocation(line: 71, column: 27, scope: !140)
!143 = !DILocation(line: 71, column: 13, scope: !137)
!144 = !DILocation(line: 73, column: 27, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !15, line: 72, column: 13)
!146 = !DILocation(line: 73, column: 32, scope: !145)
!147 = !DILocation(line: 73, column: 22, scope: !145)
!148 = !DILocation(line: 73, column: 17, scope: !145)
!149 = !DILocation(line: 73, column: 25, scope: !145)
!150 = !DILocation(line: 74, column: 13, scope: !145)
!151 = !DILocation(line: 71, column: 39, scope: !140)
!152 = !DILocation(line: 71, column: 13, scope: !140)
!153 = distinct !{!153, !143, !154, !74}
!154 = !DILocation(line: 74, column: 13, scope: !137)
!155 = !DILocation(line: 75, column: 13, scope: !127)
!156 = !DILocation(line: 75, column: 24, scope: !127)
!157 = !DILocation(line: 76, column: 23, scope: !127)
!158 = !DILocation(line: 76, column: 13, scope: !127)
!159 = !DILocation(line: 77, column: 18, scope: !127)
!160 = !DILocation(line: 77, column: 13, scope: !127)
!161 = !DILocation(line: 80, column: 1, scope: !104)
