; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
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
  %call1 = call i8* @badSource(i8* %1), !dbg !29
  store i8* %call1, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !42, metadata !DIExpression()), !dbg !43
  %3 = load i8*, i8** %data, align 8, !dbg !44
  %call2 = call i64 @strlen(i8* %3) #9, !dbg !45
  store i64 %call2, i64* %dataLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !50
  %5 = load i64, i64* %dataLen, align 8, !dbg !52
  %cmp3 = icmp ult i64 %4, %5, !dbg !53
  br i1 %cmp3, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !55
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !55
  %8 = load i8, i8* %arrayidx, align 1, !dbg !55
  %9 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !59
  store i8 %8, i8* %arrayidx4, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %10, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !67
  store i8 0, i8* %arrayidx5, align 1, !dbg !68
  %11 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* %11), !dbg !70
  %12 = load i8*, i8** %data, align 8, !dbg !71
  call void @free(i8* %12) #7, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !74 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i8*, i8** %data.addr, align 8, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !80
  %1 = load i8*, i8** %data.addr, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %2 = load i8*, i8** %data.addr, align 8, !dbg !83
  ret i8* %2, !dbg !84
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %call1 = call i8* @goodG2BSource(i8* %1), !dbg !119
  store i8* %call1, i8** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !126, metadata !DIExpression()), !dbg !127
  %3 = load i8*, i8** %data, align 8, !dbg !128
  %call2 = call i64 @strlen(i8* %3) #9, !dbg !129
  store i64 %call2, i64* %dataLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !134
  %5 = load i64, i64* %dataLen, align 8, !dbg !136
  %cmp3 = icmp ult i64 %4, %5, !dbg !137
  br i1 %cmp3, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !139
  %7 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !139
  %8 = load i8, i8* %arrayidx, align 1, !dbg !139
  %9 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !143
  store i8 %8, i8* %arrayidx4, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %10, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !150
  store i8 0, i8* %arrayidx5, align 1, !dbg !151
  %11 = load i8*, i8** %data, align 8, !dbg !152
  call void @printLine(i8* %11), !dbg !153
  %12 = load i8*, i8** %data, align 8, !dbg !154
  call void @free(i8* %12) #7, !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !157 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = load i8*, i8** %data.addr, align 8, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !161
  %1 = load i8*, i8** %data.addr, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !162
  store i8 0, i8* %arrayidx, align 1, !dbg !163
  %2 = load i8*, i8** %data.addr, align 8, !dbg !164
  ret i8* %2, !dbg !165
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_bad", scope: !15, file: !15, line: 31, type: !16, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 33, type: !4)
!19 = !DILocation(line: 33, column: 12, scope: !14)
!20 = !DILocation(line: 34, column: 20, scope: !14)
!21 = !DILocation(line: 34, column: 10, scope: !14)
!22 = !DILocation(line: 35, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 9)
!24 = !DILocation(line: 35, column: 14, scope: !23)
!25 = !DILocation(line: 35, column: 9, scope: !14)
!26 = !DILocation(line: 35, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 23)
!28 = !DILocation(line: 36, column: 22, scope: !14)
!29 = !DILocation(line: 36, column: 12, scope: !14)
!30 = !DILocation(line: 36, column: 10, scope: !14)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !15, line: 38, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 38, column: 14, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 39, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 39, column: 16, scope: !32)
!42 = !DILocalVariable(name: "dataLen", scope: !32, file: !15, line: 39, type: !38)
!43 = !DILocation(line: 39, column: 19, scope: !32)
!44 = !DILocation(line: 40, column: 26, scope: !32)
!45 = !DILocation(line: 40, column: 19, scope: !32)
!46 = !DILocation(line: 40, column: 17, scope: !32)
!47 = !DILocation(line: 42, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !32, file: !15, line: 42, column: 9)
!49 = !DILocation(line: 42, column: 14, scope: !48)
!50 = !DILocation(line: 42, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 42, column: 9)
!52 = !DILocation(line: 42, column: 25, scope: !51)
!53 = !DILocation(line: 42, column: 23, scope: !51)
!54 = !DILocation(line: 42, column: 9, scope: !48)
!55 = !DILocation(line: 44, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !15, line: 43, column: 9)
!57 = !DILocation(line: 44, column: 28, scope: !56)
!58 = !DILocation(line: 44, column: 18, scope: !56)
!59 = !DILocation(line: 44, column: 13, scope: !56)
!60 = !DILocation(line: 44, column: 21, scope: !56)
!61 = !DILocation(line: 45, column: 9, scope: !56)
!62 = !DILocation(line: 42, column: 35, scope: !51)
!63 = !DILocation(line: 42, column: 9, scope: !51)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 45, column: 9, scope: !48)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 46, column: 9, scope: !32)
!68 = !DILocation(line: 46, column: 20, scope: !32)
!69 = !DILocation(line: 47, column: 19, scope: !32)
!70 = !DILocation(line: 47, column: 9, scope: !32)
!71 = !DILocation(line: 48, column: 14, scope: !32)
!72 = !DILocation(line: 48, column: 9, scope: !32)
!73 = !DILocation(line: 50, column: 1, scope: !14)
!74 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !75, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!4, !4}
!77 = !DILocalVariable(name: "data", arg: 1, scope: !74, file: !15, line: 23, type: !4)
!78 = !DILocation(line: 23, column: 32, scope: !74)
!79 = !DILocation(line: 26, column: 12, scope: !74)
!80 = !DILocation(line: 26, column: 5, scope: !74)
!81 = !DILocation(line: 27, column: 5, scope: !74)
!82 = !DILocation(line: 27, column: 17, scope: !74)
!83 = !DILocation(line: 28, column: 12, scope: !74)
!84 = !DILocation(line: 28, column: 5, scope: !74)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_good", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 88, column: 5, scope: !85)
!87 = !DILocation(line: 89, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 101, type: !89, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 101, type: !91)
!94 = !DILocation(line: 101, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 101, type: !92)
!96 = !DILocation(line: 101, column: 27, scope: !88)
!97 = !DILocation(line: 104, column: 22, scope: !88)
!98 = !DILocation(line: 104, column: 12, scope: !88)
!99 = !DILocation(line: 104, column: 5, scope: !88)
!100 = !DILocation(line: 106, column: 5, scope: !88)
!101 = !DILocation(line: 107, column: 5, scope: !88)
!102 = !DILocation(line: 108, column: 5, scope: !88)
!103 = !DILocation(line: 111, column: 5, scope: !88)
!104 = !DILocation(line: 112, column: 5, scope: !88)
!105 = !DILocation(line: 113, column: 5, scope: !88)
!106 = !DILocation(line: 115, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 67, type: !4)
!109 = !DILocation(line: 67, column: 12, scope: !107)
!110 = !DILocation(line: 68, column: 20, scope: !107)
!111 = !DILocation(line: 68, column: 10, scope: !107)
!112 = !DILocation(line: 69, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !15, line: 69, column: 9)
!114 = !DILocation(line: 69, column: 14, scope: !113)
!115 = !DILocation(line: 69, column: 9, scope: !107)
!116 = !DILocation(line: 69, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 69, column: 23)
!118 = !DILocation(line: 70, column: 26, scope: !107)
!119 = !DILocation(line: 70, column: 12, scope: !107)
!120 = !DILocation(line: 70, column: 10, scope: !107)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !15, line: 72, type: !33)
!122 = distinct !DILexicalBlock(scope: !107, file: !15, line: 71, column: 5)
!123 = !DILocation(line: 72, column: 14, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !15, line: 73, type: !38)
!125 = !DILocation(line: 73, column: 16, scope: !122)
!126 = !DILocalVariable(name: "dataLen", scope: !122, file: !15, line: 73, type: !38)
!127 = !DILocation(line: 73, column: 19, scope: !122)
!128 = !DILocation(line: 74, column: 26, scope: !122)
!129 = !DILocation(line: 74, column: 19, scope: !122)
!130 = !DILocation(line: 74, column: 17, scope: !122)
!131 = !DILocation(line: 76, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !15, line: 76, column: 9)
!133 = !DILocation(line: 76, column: 14, scope: !132)
!134 = !DILocation(line: 76, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !15, line: 76, column: 9)
!136 = !DILocation(line: 76, column: 25, scope: !135)
!137 = !DILocation(line: 76, column: 23, scope: !135)
!138 = !DILocation(line: 76, column: 9, scope: !132)
!139 = !DILocation(line: 78, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !15, line: 77, column: 9)
!141 = !DILocation(line: 78, column: 28, scope: !140)
!142 = !DILocation(line: 78, column: 18, scope: !140)
!143 = !DILocation(line: 78, column: 13, scope: !140)
!144 = !DILocation(line: 78, column: 21, scope: !140)
!145 = !DILocation(line: 79, column: 9, scope: !140)
!146 = !DILocation(line: 76, column: 35, scope: !135)
!147 = !DILocation(line: 76, column: 9, scope: !135)
!148 = distinct !{!148, !138, !149, !66}
!149 = !DILocation(line: 79, column: 9, scope: !132)
!150 = !DILocation(line: 80, column: 9, scope: !122)
!151 = !DILocation(line: 80, column: 20, scope: !122)
!152 = !DILocation(line: 81, column: 19, scope: !122)
!153 = !DILocation(line: 81, column: 9, scope: !122)
!154 = !DILocation(line: 82, column: 14, scope: !122)
!155 = !DILocation(line: 82, column: 9, scope: !122)
!156 = !DILocation(line: 84, column: 1, scope: !107)
!157 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 56, type: !75, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", arg: 1, scope: !157, file: !15, line: 56, type: !4)
!159 = !DILocation(line: 56, column: 36, scope: !157)
!160 = !DILocation(line: 59, column: 12, scope: !157)
!161 = !DILocation(line: 59, column: 5, scope: !157)
!162 = !DILocation(line: 60, column: 5, scope: !157)
!163 = !DILocation(line: 60, column: 16, scope: !157)
!164 = !DILocation(line: 61, column: 12, scope: !157)
!165 = !DILocation(line: 61, column: 5, scope: !157)
