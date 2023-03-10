; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_31.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !24
  store i8* %call, i8** %dataBuffer, align 8, !dbg !23
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !38, metadata !DIExpression()), !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  store i8* %4, i8** %dataCopy, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !42, metadata !DIExpression()), !dbg !43
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !44
  store i8* %5, i8** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx2, align 1, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !62
  %cmp3 = icmp ult i64 %6, 100, !dbg !64
  br i1 %cmp3, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data1, align 8, !dbg !66
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !66
  %9 = load i8, i8* %arrayidx4, align 1, !dbg !66
  %10 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !70
  store i8 %9, i8* %arrayidx5, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %11, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !78
  store i8 0, i8* %arrayidx6, align 1, !dbg !79
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !80
  call void @printLine(i8* %arraydecay7), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_31_good() #0 !dbg !83 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #6, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #6, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE127_Buffer_Underread__malloc_char_loop_31_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE127_Buffer_Underread__malloc_char_loop_31_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i8* null, i8** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !111
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !112
  store i8* %call, i8** %dataBuffer, align 8, !dbg !111
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !113
  %cmp = icmp eq i8* %0, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !120
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !123
  store i8* %3, i8** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !125, metadata !DIExpression()), !dbg !127
  %4 = load i8*, i8** %data, align 8, !dbg !128
  store i8* %4, i8** %dataCopy, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !129, metadata !DIExpression()), !dbg !130
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !131
  store i8* %5, i8** %data1, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !137
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !138
  store i8 0, i8* %arrayidx2, align 1, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !143
  %cmp3 = icmp ult i64 %6, 100, !dbg !145
  br i1 %cmp3, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data1, align 8, !dbg !147
  %8 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !147
  %9 = load i8, i8* %arrayidx4, align 1, !dbg !147
  %10 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !151
  store i8 %9, i8* %arrayidx5, align 1, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %11, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !158
  store i8 0, i8* %arrayidx6, align 1, !dbg !159
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !160
  call void @printLine(i8* %arraydecay7), !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 28, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 5)
!23 = !DILocation(line: 28, column: 16, scope: !22)
!24 = !DILocation(line: 28, column: 37, scope: !22)
!25 = !DILocation(line: 29, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 29, column: 13)
!27 = !DILocation(line: 29, column: 24, scope: !26)
!28 = !DILocation(line: 29, column: 13, scope: !22)
!29 = !DILocation(line: 29, column: 34, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 33)
!31 = !DILocation(line: 30, column: 16, scope: !22)
!32 = !DILocation(line: 30, column: 9, scope: !22)
!33 = !DILocation(line: 31, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 27, scope: !22)
!35 = !DILocation(line: 33, column: 16, scope: !22)
!36 = !DILocation(line: 33, column: 27, scope: !22)
!37 = !DILocation(line: 33, column: 14, scope: !22)
!38 = !DILocalVariable(name: "dataCopy", scope: !39, file: !15, line: 36, type: !4)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!40 = !DILocation(line: 36, column: 16, scope: !39)
!41 = !DILocation(line: 36, column: 27, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !15, line: 37, type: !4)
!43 = !DILocation(line: 37, column: 16, scope: !39)
!44 = !DILocation(line: 37, column: 23, scope: !39)
!45 = !DILocalVariable(name: "i", scope: !46, file: !15, line: 39, type: !47)
!46 = distinct !DILexicalBlock(scope: !39, file: !15, line: 38, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 39, column: 20, scope: !46)
!51 = !DILocalVariable(name: "dest", scope: !46, file: !15, line: 40, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 40, column: 18, scope: !46)
!56 = !DILocation(line: 41, column: 13, scope: !46)
!57 = !DILocation(line: 42, column: 13, scope: !46)
!58 = !DILocation(line: 42, column: 25, scope: !46)
!59 = !DILocation(line: 44, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !46, file: !15, line: 44, column: 13)
!61 = !DILocation(line: 44, column: 18, scope: !60)
!62 = !DILocation(line: 44, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 44, column: 13)
!64 = !DILocation(line: 44, column: 27, scope: !63)
!65 = !DILocation(line: 44, column: 13, scope: !60)
!66 = !DILocation(line: 46, column: 27, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 45, column: 13)
!68 = !DILocation(line: 46, column: 32, scope: !67)
!69 = !DILocation(line: 46, column: 22, scope: !67)
!70 = !DILocation(line: 46, column: 17, scope: !67)
!71 = !DILocation(line: 46, column: 25, scope: !67)
!72 = !DILocation(line: 47, column: 13, scope: !67)
!73 = !DILocation(line: 44, column: 35, scope: !63)
!74 = !DILocation(line: 44, column: 13, scope: !63)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 47, column: 13, scope: !60)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 49, column: 13, scope: !46)
!79 = !DILocation(line: 49, column: 25, scope: !46)
!80 = !DILocation(line: 50, column: 23, scope: !46)
!81 = !DILocation(line: 50, column: 13, scope: !46)
!82 = !DILocation(line: 55, column: 1, scope: !14)
!83 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_31_good", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 98, column: 5, scope: !83)
!85 = !DILocation(line: 99, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !87, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!89, !89, !90}
!89 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !15, line: 110, type: !89)
!92 = !DILocation(line: 110, column: 14, scope: !86)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !15, line: 110, type: !90)
!94 = !DILocation(line: 110, column: 27, scope: !86)
!95 = !DILocation(line: 113, column: 22, scope: !86)
!96 = !DILocation(line: 113, column: 12, scope: !86)
!97 = !DILocation(line: 113, column: 5, scope: !86)
!98 = !DILocation(line: 115, column: 5, scope: !86)
!99 = !DILocation(line: 116, column: 5, scope: !86)
!100 = !DILocation(line: 117, column: 5, scope: !86)
!101 = !DILocation(line: 120, column: 5, scope: !86)
!102 = !DILocation(line: 121, column: 5, scope: !86)
!103 = !DILocation(line: 122, column: 5, scope: !86)
!104 = !DILocation(line: 124, column: 5, scope: !86)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 64, type: !4)
!107 = !DILocation(line: 64, column: 12, scope: !105)
!108 = !DILocation(line: 65, column: 10, scope: !105)
!109 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !15, line: 67, type: !4)
!110 = distinct !DILexicalBlock(scope: !105, file: !15, line: 66, column: 5)
!111 = !DILocation(line: 67, column: 16, scope: !110)
!112 = !DILocation(line: 67, column: 37, scope: !110)
!113 = !DILocation(line: 68, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 68, column: 13)
!115 = !DILocation(line: 68, column: 24, scope: !114)
!116 = !DILocation(line: 68, column: 13, scope: !110)
!117 = !DILocation(line: 68, column: 34, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 68, column: 33)
!119 = !DILocation(line: 69, column: 16, scope: !110)
!120 = !DILocation(line: 69, column: 9, scope: !110)
!121 = !DILocation(line: 70, column: 9, scope: !110)
!122 = !DILocation(line: 70, column: 27, scope: !110)
!123 = !DILocation(line: 72, column: 16, scope: !110)
!124 = !DILocation(line: 72, column: 14, scope: !110)
!125 = !DILocalVariable(name: "dataCopy", scope: !126, file: !15, line: 75, type: !4)
!126 = distinct !DILexicalBlock(scope: !105, file: !15, line: 74, column: 5)
!127 = !DILocation(line: 75, column: 16, scope: !126)
!128 = !DILocation(line: 75, column: 27, scope: !126)
!129 = !DILocalVariable(name: "data", scope: !126, file: !15, line: 76, type: !4)
!130 = !DILocation(line: 76, column: 16, scope: !126)
!131 = !DILocation(line: 76, column: 23, scope: !126)
!132 = !DILocalVariable(name: "i", scope: !133, file: !15, line: 78, type: !47)
!133 = distinct !DILexicalBlock(scope: !126, file: !15, line: 77, column: 9)
!134 = !DILocation(line: 78, column: 20, scope: !133)
!135 = !DILocalVariable(name: "dest", scope: !133, file: !15, line: 79, type: !52)
!136 = !DILocation(line: 79, column: 18, scope: !133)
!137 = !DILocation(line: 80, column: 13, scope: !133)
!138 = !DILocation(line: 81, column: 13, scope: !133)
!139 = !DILocation(line: 81, column: 25, scope: !133)
!140 = !DILocation(line: 83, column: 20, scope: !141)
!141 = distinct !DILexicalBlock(scope: !133, file: !15, line: 83, column: 13)
!142 = !DILocation(line: 83, column: 18, scope: !141)
!143 = !DILocation(line: 83, column: 25, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !15, line: 83, column: 13)
!145 = !DILocation(line: 83, column: 27, scope: !144)
!146 = !DILocation(line: 83, column: 13, scope: !141)
!147 = !DILocation(line: 85, column: 27, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !15, line: 84, column: 13)
!149 = !DILocation(line: 85, column: 32, scope: !148)
!150 = !DILocation(line: 85, column: 22, scope: !148)
!151 = !DILocation(line: 85, column: 17, scope: !148)
!152 = !DILocation(line: 85, column: 25, scope: !148)
!153 = !DILocation(line: 86, column: 13, scope: !148)
!154 = !DILocation(line: 83, column: 35, scope: !144)
!155 = !DILocation(line: 83, column: 13, scope: !144)
!156 = distinct !{!156, !146, !157, !77}
!157 = !DILocation(line: 86, column: 13, scope: !141)
!158 = !DILocation(line: 88, column: 13, scope: !133)
!159 = !DILocation(line: 88, column: 25, scope: !133)
!160 = !DILocation(line: 89, column: 23, scope: !133)
!161 = !DILocation(line: 89, column: 13, scope: !133)
!162 = !DILocation(line: 94, column: 1, scope: !105)
