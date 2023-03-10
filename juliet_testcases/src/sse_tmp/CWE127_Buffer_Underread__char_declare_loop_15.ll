; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !28
  store i8* %add.ptr, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx3, align 1, !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %0, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !48
  %2 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx4 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !48
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !48
  %4 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !52
  store i8 %3, i8* %arrayidx5, align 1, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %5, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx6, align 1, !dbg !61
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @printLine(i8* %arraydecay7), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_15_good() #0 !dbg !65 {
entry:
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE127_Buffer_Underread__char_declare_loop_15_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE127_Buffer_Underread__char_declare_loop_15_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !93
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !96
  store i8* %arraydecay1, i8** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i64* %i, metadata !98, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx3, align 1, !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !109
  %cmp = icmp ult i64 %0, 100, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !113
  %2 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx4 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !113
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !113
  %4 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !117
  store i8 %3, i8* %arrayidx5, align 1, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %5, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx6, align 1, !dbg !125
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @printLine(i8* %arraydecay7), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !129 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !134
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !135
  store i8 0, i8* %arrayidx, align 1, !dbg !136
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !137
  store i8* %arraydecay1, i8** %data, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !144
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx3, align 1, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !150
  %cmp = icmp ult i64 %0, 100, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data, align 8, !dbg !154
  %2 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx4 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !154
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !154
  %4 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !158
  store i8 %3, i8* %arrayidx5, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %5, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx6, align 1, !dbg !166
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* %arraydecay7), !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 33, column: 16, scope: !11)
!28 = !DILocation(line: 33, column: 27, scope: !11)
!29 = !DILocation(line: 33, column: 14, scope: !11)
!30 = !DILocalVariable(name: "i", scope: !31, file: !12, line: 41, type: !32)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 41, column: 16, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 42, type: !20)
!37 = !DILocation(line: 42, column: 14, scope: !31)
!38 = !DILocation(line: 43, column: 9, scope: !31)
!39 = !DILocation(line: 44, column: 9, scope: !31)
!40 = !DILocation(line: 44, column: 21, scope: !31)
!41 = !DILocation(line: 46, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !31, file: !12, line: 46, column: 9)
!43 = !DILocation(line: 46, column: 14, scope: !42)
!44 = !DILocation(line: 46, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 46, column: 9)
!46 = !DILocation(line: 46, column: 23, scope: !45)
!47 = !DILocation(line: 46, column: 9, scope: !42)
!48 = !DILocation(line: 48, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 47, column: 9)
!50 = !DILocation(line: 48, column: 28, scope: !49)
!51 = !DILocation(line: 48, column: 18, scope: !49)
!52 = !DILocation(line: 48, column: 13, scope: !49)
!53 = !DILocation(line: 48, column: 21, scope: !49)
!54 = !DILocation(line: 49, column: 9, scope: !49)
!55 = !DILocation(line: 46, column: 31, scope: !45)
!56 = !DILocation(line: 46, column: 9, scope: !45)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 49, column: 9, scope: !42)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 51, column: 9, scope: !31)
!61 = !DILocation(line: 51, column: 21, scope: !31)
!62 = !DILocation(line: 52, column: 19, scope: !31)
!63 = !DILocation(line: 52, column: 9, scope: !31)
!64 = !DILocation(line: 54, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_15_good", scope: !12, file: !12, line: 128, type: !13, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 130, column: 5, scope: !65)
!67 = !DILocation(line: 131, column: 5, scope: !65)
!68 = !DILocation(line: 132, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 144, type: !70, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !72, !73}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !12, line: 144, type: !72)
!75 = !DILocation(line: 144, column: 14, scope: !69)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !12, line: 144, type: !73)
!77 = !DILocation(line: 144, column: 27, scope: !69)
!78 = !DILocation(line: 147, column: 22, scope: !69)
!79 = !DILocation(line: 147, column: 12, scope: !69)
!80 = !DILocation(line: 147, column: 5, scope: !69)
!81 = !DILocation(line: 149, column: 5, scope: !69)
!82 = !DILocation(line: 150, column: 5, scope: !69)
!83 = !DILocation(line: 151, column: 5, scope: !69)
!84 = !DILocation(line: 154, column: 5, scope: !69)
!85 = !DILocation(line: 155, column: 5, scope: !69)
!86 = !DILocation(line: 156, column: 5, scope: !69)
!87 = !DILocation(line: 158, column: 5, scope: !69)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 63, type: !16)
!90 = !DILocation(line: 63, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !12, line: 64, type: !20)
!92 = !DILocation(line: 64, column: 10, scope: !88)
!93 = !DILocation(line: 65, column: 5, scope: !88)
!94 = !DILocation(line: 66, column: 5, scope: !88)
!95 = !DILocation(line: 66, column: 23, scope: !88)
!96 = !DILocation(line: 75, column: 16, scope: !88)
!97 = !DILocation(line: 75, column: 14, scope: !88)
!98 = !DILocalVariable(name: "i", scope: !99, file: !12, line: 79, type: !32)
!99 = distinct !DILexicalBlock(scope: !88, file: !12, line: 78, column: 5)
!100 = !DILocation(line: 79, column: 16, scope: !99)
!101 = !DILocalVariable(name: "dest", scope: !99, file: !12, line: 80, type: !20)
!102 = !DILocation(line: 80, column: 14, scope: !99)
!103 = !DILocation(line: 81, column: 9, scope: !99)
!104 = !DILocation(line: 82, column: 9, scope: !99)
!105 = !DILocation(line: 82, column: 21, scope: !99)
!106 = !DILocation(line: 84, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !12, line: 84, column: 9)
!108 = !DILocation(line: 84, column: 14, scope: !107)
!109 = !DILocation(line: 84, column: 21, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 84, column: 9)
!111 = !DILocation(line: 84, column: 23, scope: !110)
!112 = !DILocation(line: 84, column: 9, scope: !107)
!113 = !DILocation(line: 86, column: 23, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 85, column: 9)
!115 = !DILocation(line: 86, column: 28, scope: !114)
!116 = !DILocation(line: 86, column: 18, scope: !114)
!117 = !DILocation(line: 86, column: 13, scope: !114)
!118 = !DILocation(line: 86, column: 21, scope: !114)
!119 = !DILocation(line: 87, column: 9, scope: !114)
!120 = !DILocation(line: 84, column: 31, scope: !110)
!121 = !DILocation(line: 84, column: 9, scope: !110)
!122 = distinct !{!122, !112, !123, !59}
!123 = !DILocation(line: 87, column: 9, scope: !107)
!124 = !DILocation(line: 89, column: 9, scope: !99)
!125 = !DILocation(line: 89, column: 21, scope: !99)
!126 = !DILocation(line: 90, column: 19, scope: !99)
!127 = !DILocation(line: 90, column: 9, scope: !99)
!128 = !DILocation(line: 92, column: 1, scope: !88)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !12, line: 97, type: !16)
!131 = !DILocation(line: 97, column: 12, scope: !129)
!132 = !DILocalVariable(name: "dataBuffer", scope: !129, file: !12, line: 98, type: !20)
!133 = !DILocation(line: 98, column: 10, scope: !129)
!134 = !DILocation(line: 99, column: 5, scope: !129)
!135 = !DILocation(line: 100, column: 5, scope: !129)
!136 = !DILocation(line: 100, column: 23, scope: !129)
!137 = !DILocation(line: 105, column: 16, scope: !129)
!138 = !DILocation(line: 105, column: 14, scope: !129)
!139 = !DILocalVariable(name: "i", scope: !140, file: !12, line: 113, type: !32)
!140 = distinct !DILexicalBlock(scope: !129, file: !12, line: 112, column: 5)
!141 = !DILocation(line: 113, column: 16, scope: !140)
!142 = !DILocalVariable(name: "dest", scope: !140, file: !12, line: 114, type: !20)
!143 = !DILocation(line: 114, column: 14, scope: !140)
!144 = !DILocation(line: 115, column: 9, scope: !140)
!145 = !DILocation(line: 116, column: 9, scope: !140)
!146 = !DILocation(line: 116, column: 21, scope: !140)
!147 = !DILocation(line: 118, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !140, file: !12, line: 118, column: 9)
!149 = !DILocation(line: 118, column: 14, scope: !148)
!150 = !DILocation(line: 118, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !12, line: 118, column: 9)
!152 = !DILocation(line: 118, column: 23, scope: !151)
!153 = !DILocation(line: 118, column: 9, scope: !148)
!154 = !DILocation(line: 120, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !12, line: 119, column: 9)
!156 = !DILocation(line: 120, column: 28, scope: !155)
!157 = !DILocation(line: 120, column: 18, scope: !155)
!158 = !DILocation(line: 120, column: 13, scope: !155)
!159 = !DILocation(line: 120, column: 21, scope: !155)
!160 = !DILocation(line: 121, column: 9, scope: !155)
!161 = !DILocation(line: 118, column: 31, scope: !151)
!162 = !DILocation(line: 118, column: 9, scope: !151)
!163 = distinct !{!163, !153, !164, !59}
!164 = !DILocation(line: 121, column: 9, scope: !148)
!165 = !DILocation(line: 123, column: 9, scope: !140)
!166 = !DILocation(line: 123, column: 21, scope: !140)
!167 = !DILocation(line: 124, column: 19, scope: !140)
!168 = !DILocation(line: 124, column: 9, scope: !140)
!169 = !DILocation(line: 126, column: 1, scope: !129)
