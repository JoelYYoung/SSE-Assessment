; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %data, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx1, align 1, !dbg !51
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !53
  store i64 %call3, i64* %destLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !58
  %4 = load i64, i64* %destLen, align 8, !dbg !60
  %cmp4 = icmp ult i64 %3, %4, !dbg !61
  br i1 %cmp4, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !63
  %6 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !63
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !63
  %8 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !67
  store i8 %7, i8* %arrayidx6, align 1, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %9, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !75
  store i8 0, i8* %arrayidx7, align 1, !dbg !76
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !77
  call void @printLine(i8* %arraydecay8), !dbg !78
  %10 = load i8*, i8** %data, align 8, !dbg !79
  call void @free(i8* %10) #7, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_18_good() #0 !dbg !82 {
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
  call void @CWE126_Buffer_Overread__malloc_char_loop_18_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__malloc_char_loop_18_bad(), !dbg !101
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
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i8* null, i8** %data, align 8, !dbg !107
  br label %source, !dbg !108

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !109), !dbg !110
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !111
  store i8* %call, i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  %cmp = icmp eq i8* %0, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %data, align 8, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !120
  %2 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx1, align 1, !dbg !132
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !133
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !134
  store i64 %call3, i64* %destLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !139
  %4 = load i64, i64* %destLen, align 8, !dbg !141
  %cmp4 = icmp ult i64 %3, %4, !dbg !142
  br i1 %cmp4, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !144
  %6 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !144
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !144
  %8 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !148
  store i8 %7, i8* %arrayidx6, align 1, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %9, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !155
  store i8 0, i8* %arrayidx7, align 1, !dbg !156
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @printLine(i8* %arraydecay8), !dbg !158
  %10 = load i8*, i8** %data, align 8, !dbg !159
  call void @free(i8* %10) #7, !dbg !160
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_18_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !15, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocation(line: 30, column: 20, scope: !14)
!25 = !DILocation(line: 30, column: 10, scope: !14)
!26 = !DILocation(line: 31, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 9)
!28 = !DILocation(line: 31, column: 14, scope: !27)
!29 = !DILocation(line: 31, column: 9, scope: !14)
!30 = !DILocation(line: 31, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 23)
!32 = !DILocation(line: 32, column: 12, scope: !14)
!33 = !DILocation(line: 32, column: 5, scope: !14)
!34 = !DILocation(line: 33, column: 5, scope: !14)
!35 = !DILocation(line: 33, column: 16, scope: !14)
!36 = !DILocalVariable(name: "i", scope: !37, file: !15, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 35, column: 16, scope: !37)
!42 = !DILocalVariable(name: "destLen", scope: !37, file: !15, line: 35, type: !38)
!43 = !DILocation(line: 35, column: 19, scope: !37)
!44 = !DILocalVariable(name: "dest", scope: !37, file: !15, line: 36, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 36, column: 14, scope: !37)
!49 = !DILocation(line: 37, column: 9, scope: !37)
!50 = !DILocation(line: 38, column: 9, scope: !37)
!51 = !DILocation(line: 38, column: 21, scope: !37)
!52 = !DILocation(line: 39, column: 26, scope: !37)
!53 = !DILocation(line: 39, column: 19, scope: !37)
!54 = !DILocation(line: 39, column: 17, scope: !37)
!55 = !DILocation(line: 42, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !37, file: !15, line: 42, column: 9)
!57 = !DILocation(line: 42, column: 14, scope: !56)
!58 = !DILocation(line: 42, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !15, line: 42, column: 9)
!60 = !DILocation(line: 42, column: 25, scope: !59)
!61 = !DILocation(line: 42, column: 23, scope: !59)
!62 = !DILocation(line: 42, column: 9, scope: !56)
!63 = !DILocation(line: 44, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !15, line: 43, column: 9)
!65 = !DILocation(line: 44, column: 28, scope: !64)
!66 = !DILocation(line: 44, column: 18, scope: !64)
!67 = !DILocation(line: 44, column: 13, scope: !64)
!68 = !DILocation(line: 44, column: 21, scope: !64)
!69 = !DILocation(line: 45, column: 9, scope: !64)
!70 = !DILocation(line: 42, column: 35, scope: !59)
!71 = !DILocation(line: 42, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 45, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 46, column: 9, scope: !37)
!76 = !DILocation(line: 46, column: 21, scope: !37)
!77 = !DILocation(line: 47, column: 19, scope: !37)
!78 = !DILocation(line: 47, column: 9, scope: !37)
!79 = !DILocation(line: 48, column: 14, scope: !37)
!80 = !DILocation(line: 48, column: 9, scope: !37)
!81 = !DILocation(line: 50, column: 1, scope: !14)
!82 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_18_good", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 88, column: 5, scope: !82)
!84 = !DILocation(line: 89, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 101, type: !86, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 101, type: !88)
!91 = !DILocation(line: 101, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 101, type: !89)
!93 = !DILocation(line: 101, column: 27, scope: !85)
!94 = !DILocation(line: 104, column: 22, scope: !85)
!95 = !DILocation(line: 104, column: 12, scope: !85)
!96 = !DILocation(line: 104, column: 5, scope: !85)
!97 = !DILocation(line: 106, column: 5, scope: !85)
!98 = !DILocation(line: 107, column: 5, scope: !85)
!99 = !DILocation(line: 108, column: 5, scope: !85)
!100 = !DILocation(line: 111, column: 5, scope: !85)
!101 = !DILocation(line: 112, column: 5, scope: !85)
!102 = !DILocation(line: 113, column: 5, scope: !85)
!103 = !DILocation(line: 115, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 59, type: !4)
!106 = !DILocation(line: 59, column: 12, scope: !104)
!107 = !DILocation(line: 60, column: 10, scope: !104)
!108 = !DILocation(line: 61, column: 5, scope: !104)
!109 = !DILabel(scope: !104, name: "source", file: !15, line: 62)
!110 = !DILocation(line: 62, column: 1, scope: !104)
!111 = !DILocation(line: 64, column: 20, scope: !104)
!112 = !DILocation(line: 64, column: 10, scope: !104)
!113 = !DILocation(line: 65, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !15, line: 65, column: 9)
!115 = !DILocation(line: 65, column: 14, scope: !114)
!116 = !DILocation(line: 65, column: 9, scope: !104)
!117 = !DILocation(line: 65, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 65, column: 23)
!119 = !DILocation(line: 66, column: 12, scope: !104)
!120 = !DILocation(line: 66, column: 5, scope: !104)
!121 = !DILocation(line: 67, column: 5, scope: !104)
!122 = !DILocation(line: 67, column: 17, scope: !104)
!123 = !DILocalVariable(name: "i", scope: !124, file: !15, line: 69, type: !38)
!124 = distinct !DILexicalBlock(scope: !104, file: !15, line: 68, column: 5)
!125 = !DILocation(line: 69, column: 16, scope: !124)
!126 = !DILocalVariable(name: "destLen", scope: !124, file: !15, line: 69, type: !38)
!127 = !DILocation(line: 69, column: 19, scope: !124)
!128 = !DILocalVariable(name: "dest", scope: !124, file: !15, line: 70, type: !45)
!129 = !DILocation(line: 70, column: 14, scope: !124)
!130 = !DILocation(line: 71, column: 9, scope: !124)
!131 = !DILocation(line: 72, column: 9, scope: !124)
!132 = !DILocation(line: 72, column: 21, scope: !124)
!133 = !DILocation(line: 73, column: 26, scope: !124)
!134 = !DILocation(line: 73, column: 19, scope: !124)
!135 = !DILocation(line: 73, column: 17, scope: !124)
!136 = !DILocation(line: 76, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !124, file: !15, line: 76, column: 9)
!138 = !DILocation(line: 76, column: 14, scope: !137)
!139 = !DILocation(line: 76, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 76, column: 9)
!141 = !DILocation(line: 76, column: 25, scope: !140)
!142 = !DILocation(line: 76, column: 23, scope: !140)
!143 = !DILocation(line: 76, column: 9, scope: !137)
!144 = !DILocation(line: 78, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !15, line: 77, column: 9)
!146 = !DILocation(line: 78, column: 28, scope: !145)
!147 = !DILocation(line: 78, column: 18, scope: !145)
!148 = !DILocation(line: 78, column: 13, scope: !145)
!149 = !DILocation(line: 78, column: 21, scope: !145)
!150 = !DILocation(line: 79, column: 9, scope: !145)
!151 = !DILocation(line: 76, column: 35, scope: !140)
!152 = !DILocation(line: 76, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !74}
!154 = !DILocation(line: 79, column: 9, scope: !137)
!155 = !DILocation(line: 80, column: 9, scope: !124)
!156 = !DILocation(line: 80, column: 21, scope: !124)
!157 = !DILocation(line: 81, column: 19, scope: !124)
!158 = !DILocation(line: 81, column: 9, scope: !124)
!159 = !DILocation(line: 82, column: 14, scope: !124)
!160 = !DILocation(line: 82, column: 9, scope: !124)
!161 = !DILocation(line: 84, column: 1, scope: !104)
