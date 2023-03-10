; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_42.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !35
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %1, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %3 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !45
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !45
  %5 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !49
  store i8 %4, i8* %arrayidx2, align 1, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %6, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx3, align 1, !dbg !58
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @printLine(i8* %arraydecay4), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !62 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !67, metadata !DIExpression()), !dbg !69
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !70
  store i8* %call, i8** %dataBuffer, align 8, !dbg !69
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  %cmp = icmp eq i8* %0, null, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !78
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !82
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !83
  %4 = load i8*, i8** %data.addr, align 8, !dbg !84
  ret i8* %4, !dbg !85
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_42_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #6, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #6, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE127_Buffer_Underread__malloc_char_loop_42_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE127_Buffer_Underread__malloc_char_loop_42_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* null, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %call = call i8* @goodG2BSource(i8* %0), !dbg !113
  store i8* %call, i8** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %1, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !130
  %3 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !130
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !130
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !134
  store i8 %4, i8* %arrayidx2, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %6, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx3, align 1, !dbg !142
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  call void @printLine(i8* %arraydecay4), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !146 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !149, metadata !DIExpression()), !dbg !151
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !152
  store i8* %call, i8** %dataBuffer, align 8, !dbg !151
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !153
  %cmp = icmp eq i8* %0, null, !dbg !155
  br i1 %cmp, label %if.then, label %if.end, !dbg !156

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !157
  unreachable, !dbg !157

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !160
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !161
  store i8 0, i8* %arrayidx, align 1, !dbg !162
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !163
  store i8* %3, i8** %data.addr, align 8, !dbg !164
  %4 = load i8*, i8** %data.addr, align 8, !dbg !165
  ret i8* %4, !dbg !166
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_42_bad", scope: !15, file: !15, line: 36, type: !16, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 38, type: !5)
!19 = !DILocation(line: 38, column: 12, scope: !14)
!20 = !DILocation(line: 39, column: 10, scope: !14)
!21 = !DILocation(line: 40, column: 22, scope: !14)
!22 = !DILocation(line: 40, column: 12, scope: !14)
!23 = !DILocation(line: 40, column: 10, scope: !14)
!24 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 42, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 42, column: 16, scope: !25)
!30 = !DILocalVariable(name: "dest", scope: !25, file: !15, line: 43, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 43, column: 14, scope: !25)
!35 = !DILocation(line: 44, column: 9, scope: !25)
!36 = !DILocation(line: 45, column: 9, scope: !25)
!37 = !DILocation(line: 45, column: 21, scope: !25)
!38 = !DILocation(line: 47, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !25, file: !15, line: 47, column: 9)
!40 = !DILocation(line: 47, column: 14, scope: !39)
!41 = !DILocation(line: 47, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !15, line: 47, column: 9)
!43 = !DILocation(line: 47, column: 23, scope: !42)
!44 = !DILocation(line: 47, column: 9, scope: !39)
!45 = !DILocation(line: 49, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 48, column: 9)
!47 = !DILocation(line: 49, column: 28, scope: !46)
!48 = !DILocation(line: 49, column: 18, scope: !46)
!49 = !DILocation(line: 49, column: 13, scope: !46)
!50 = !DILocation(line: 49, column: 21, scope: !46)
!51 = !DILocation(line: 50, column: 9, scope: !46)
!52 = !DILocation(line: 47, column: 31, scope: !42)
!53 = !DILocation(line: 47, column: 9, scope: !42)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 50, column: 9, scope: !39)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 52, column: 9, scope: !25)
!58 = !DILocation(line: 52, column: 21, scope: !25)
!59 = !DILocation(line: 53, column: 19, scope: !25)
!60 = !DILocation(line: 53, column: 9, scope: !25)
!61 = !DILocation(line: 57, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !63, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!5, !5}
!65 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !15, line: 23, type: !5)
!66 = !DILocation(line: 23, column: 32, scope: !62)
!67 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !15, line: 26, type: !5)
!68 = distinct !DILexicalBlock(scope: !62, file: !15, line: 25, column: 5)
!69 = !DILocation(line: 26, column: 16, scope: !68)
!70 = !DILocation(line: 26, column: 37, scope: !68)
!71 = !DILocation(line: 27, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !15, line: 27, column: 13)
!73 = !DILocation(line: 27, column: 24, scope: !72)
!74 = !DILocation(line: 27, column: 13, scope: !68)
!75 = !DILocation(line: 27, column: 34, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 27, column: 33)
!77 = !DILocation(line: 28, column: 16, scope: !68)
!78 = !DILocation(line: 28, column: 9, scope: !68)
!79 = !DILocation(line: 29, column: 9, scope: !68)
!80 = !DILocation(line: 29, column: 27, scope: !68)
!81 = !DILocation(line: 31, column: 16, scope: !68)
!82 = !DILocation(line: 31, column: 27, scope: !68)
!83 = !DILocation(line: 31, column: 14, scope: !68)
!84 = !DILocation(line: 33, column: 12, scope: !62)
!85 = !DILocation(line: 33, column: 5, scope: !62)
!86 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_42_good", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 102, column: 5, scope: !86)
!88 = !DILocation(line: 103, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 115, type: !90, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !92, !93}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !15, line: 115, type: !92)
!95 = !DILocation(line: 115, column: 14, scope: !89)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !15, line: 115, type: !93)
!97 = !DILocation(line: 115, column: 27, scope: !89)
!98 = !DILocation(line: 118, column: 22, scope: !89)
!99 = !DILocation(line: 118, column: 12, scope: !89)
!100 = !DILocation(line: 118, column: 5, scope: !89)
!101 = !DILocation(line: 120, column: 5, scope: !89)
!102 = !DILocation(line: 121, column: 5, scope: !89)
!103 = !DILocation(line: 122, column: 5, scope: !89)
!104 = !DILocation(line: 125, column: 5, scope: !89)
!105 = !DILocation(line: 126, column: 5, scope: !89)
!106 = !DILocation(line: 127, column: 5, scope: !89)
!107 = !DILocation(line: 129, column: 5, scope: !89)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 77, type: !16, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 79, type: !5)
!110 = !DILocation(line: 79, column: 12, scope: !108)
!111 = !DILocation(line: 80, column: 10, scope: !108)
!112 = !DILocation(line: 81, column: 26, scope: !108)
!113 = !DILocation(line: 81, column: 12, scope: !108)
!114 = !DILocation(line: 81, column: 10, scope: !108)
!115 = !DILocalVariable(name: "i", scope: !116, file: !15, line: 83, type: !26)
!116 = distinct !DILexicalBlock(scope: !108, file: !15, line: 82, column: 5)
!117 = !DILocation(line: 83, column: 16, scope: !116)
!118 = !DILocalVariable(name: "dest", scope: !116, file: !15, line: 84, type: !31)
!119 = !DILocation(line: 84, column: 14, scope: !116)
!120 = !DILocation(line: 85, column: 9, scope: !116)
!121 = !DILocation(line: 86, column: 9, scope: !116)
!122 = !DILocation(line: 86, column: 21, scope: !116)
!123 = !DILocation(line: 88, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !15, line: 88, column: 9)
!125 = !DILocation(line: 88, column: 14, scope: !124)
!126 = !DILocation(line: 88, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 88, column: 9)
!128 = !DILocation(line: 88, column: 23, scope: !127)
!129 = !DILocation(line: 88, column: 9, scope: !124)
!130 = !DILocation(line: 90, column: 23, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 89, column: 9)
!132 = !DILocation(line: 90, column: 28, scope: !131)
!133 = !DILocation(line: 90, column: 18, scope: !131)
!134 = !DILocation(line: 90, column: 13, scope: !131)
!135 = !DILocation(line: 90, column: 21, scope: !131)
!136 = !DILocation(line: 91, column: 9, scope: !131)
!137 = !DILocation(line: 88, column: 31, scope: !127)
!138 = !DILocation(line: 88, column: 9, scope: !127)
!139 = distinct !{!139, !129, !140, !56}
!140 = !DILocation(line: 91, column: 9, scope: !124)
!141 = !DILocation(line: 93, column: 9, scope: !116)
!142 = !DILocation(line: 93, column: 21, scope: !116)
!143 = !DILocation(line: 94, column: 19, scope: !116)
!144 = !DILocation(line: 94, column: 9, scope: !116)
!145 = !DILocation(line: 98, column: 1, scope: !108)
!146 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 63, type: !63, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", arg: 1, scope: !146, file: !15, line: 63, type: !5)
!148 = !DILocation(line: 63, column: 36, scope: !146)
!149 = !DILocalVariable(name: "dataBuffer", scope: !150, file: !15, line: 66, type: !5)
!150 = distinct !DILexicalBlock(scope: !146, file: !15, line: 65, column: 5)
!151 = !DILocation(line: 66, column: 16, scope: !150)
!152 = !DILocation(line: 66, column: 37, scope: !150)
!153 = !DILocation(line: 67, column: 13, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 67, column: 13)
!155 = !DILocation(line: 67, column: 24, scope: !154)
!156 = !DILocation(line: 67, column: 13, scope: !150)
!157 = !DILocation(line: 67, column: 34, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 67, column: 33)
!159 = !DILocation(line: 68, column: 16, scope: !150)
!160 = !DILocation(line: 68, column: 9, scope: !150)
!161 = !DILocation(line: 69, column: 9, scope: !150)
!162 = !DILocation(line: 69, column: 27, scope: !150)
!163 = !DILocation(line: 71, column: 16, scope: !150)
!164 = !DILocation(line: 71, column: 14, scope: !150)
!165 = !DILocation(line: 73, column: 12, scope: !146)
!166 = !DILocation(line: 73, column: 5, scope: !146)
