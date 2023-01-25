; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %call = call i8* @badSource(i8* %0), !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !29, metadata !DIExpression()), !dbg !34
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !40, metadata !DIExpression()), !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !43
  store i64 %call1, i64* %dataLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !48
  %4 = load i64, i64* %dataLen, align 8, !dbg !50
  %cmp = icmp ult i64 %3, %4, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !53
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !53
  %7 = load i8, i8* %arrayidx, align 1, !dbg !53
  %8 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !57
  store i8 %7, i8* %arrayidx2, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %9, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !65
  store i8 0, i8* %arrayidx3, align 1, !dbg !66
  %10 = load i8*, i8** %data, align 8, !dbg !67
  call void @printLine(i8* %10), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !70 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i8*, i8** %data.addr, align 8, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !76
  %1 = load i8*, i8** %data.addr, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  %2 = load i8*, i8** %data.addr, align 8, !dbg !79
  ret i8* %2, !dbg !80
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i8* %arraydecay, i8** %data, align 8, !dbg !109
  %0 = load i8*, i8** %data, align 8, !dbg !110
  %call = call i8* @goodG2BSource(i8* %0), !dbg !111
  store i8* %call, i8** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !118, metadata !DIExpression()), !dbg !119
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %call1 = call i64 @strlen(i8* %2) #6, !dbg !121
  store i64 %call1, i64* %dataLen, align 8, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !126
  %4 = load i64, i64* %dataLen, align 8, !dbg !128
  %cmp = icmp ult i64 %3, %4, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !131
  %6 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !131
  %7 = load i8, i8* %arrayidx, align 1, !dbg !131
  %8 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !135
  store i8 %7, i8* %arrayidx2, align 1, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %9, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !142
  store i8 0, i8* %arrayidx3, align 1, !dbg !143
  %10 = load i8*, i8** %data, align 8, !dbg !144
  call void @printLine(i8* %10), !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !147 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = load i8*, i8** %data.addr, align 8, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !151
  %1 = load i8*, i8** %data.addr, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  %2 = load i8*, i8** %data.addr, align 8, !dbg !154
  ret i8* %2, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 33, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 34, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 34, column: 10, scope: !11)
!24 = !DILocation(line: 35, column: 12, scope: !11)
!25 = !DILocation(line: 35, column: 10, scope: !11)
!26 = !DILocation(line: 36, column: 22, scope: !11)
!27 = !DILocation(line: 36, column: 12, scope: !11)
!28 = !DILocation(line: 36, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dest", scope: !30, file: !12, line: 38, type: !31)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 38, column: 14, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !30, file: !12, line: 39, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 39, column: 16, scope: !30)
!40 = !DILocalVariable(name: "dataLen", scope: !30, file: !12, line: 39, type: !36)
!41 = !DILocation(line: 39, column: 19, scope: !30)
!42 = !DILocation(line: 40, column: 26, scope: !30)
!43 = !DILocation(line: 40, column: 19, scope: !30)
!44 = !DILocation(line: 40, column: 17, scope: !30)
!45 = !DILocation(line: 42, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !30, file: !12, line: 42, column: 9)
!47 = !DILocation(line: 42, column: 14, scope: !46)
!48 = !DILocation(line: 42, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 42, column: 9)
!50 = !DILocation(line: 42, column: 25, scope: !49)
!51 = !DILocation(line: 42, column: 23, scope: !49)
!52 = !DILocation(line: 42, column: 9, scope: !46)
!53 = !DILocation(line: 44, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !12, line: 43, column: 9)
!55 = !DILocation(line: 44, column: 28, scope: !54)
!56 = !DILocation(line: 44, column: 18, scope: !54)
!57 = !DILocation(line: 44, column: 13, scope: !54)
!58 = !DILocation(line: 44, column: 21, scope: !54)
!59 = !DILocation(line: 45, column: 9, scope: !54)
!60 = !DILocation(line: 42, column: 35, scope: !49)
!61 = !DILocation(line: 42, column: 9, scope: !49)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 45, column: 9, scope: !46)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 46, column: 9, scope: !30)
!66 = !DILocation(line: 46, column: 20, scope: !30)
!67 = !DILocation(line: 47, column: 19, scope: !30)
!68 = !DILocation(line: 47, column: 9, scope: !30)
!69 = !DILocation(line: 49, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 23, type: !71, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!16, !16}
!73 = !DILocalVariable(name: "data", arg: 1, scope: !70, file: !12, line: 23, type: !16)
!74 = !DILocation(line: 23, column: 32, scope: !70)
!75 = !DILocation(line: 26, column: 12, scope: !70)
!76 = !DILocation(line: 26, column: 5, scope: !70)
!77 = !DILocation(line: 27, column: 5, scope: !70)
!78 = !DILocation(line: 27, column: 17, scope: !70)
!79 = !DILocation(line: 28, column: 12, scope: !70)
!80 = !DILocation(line: 28, column: 5, scope: !70)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_42_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 86, column: 5, scope: !81)
!83 = !DILocation(line: 87, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !85, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 99, type: !87)
!90 = !DILocation(line: 99, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 99, type: !88)
!92 = !DILocation(line: 99, column: 27, scope: !84)
!93 = !DILocation(line: 102, column: 22, scope: !84)
!94 = !DILocation(line: 102, column: 12, scope: !84)
!95 = !DILocation(line: 102, column: 5, scope: !84)
!96 = !DILocation(line: 104, column: 5, scope: !84)
!97 = !DILocation(line: 105, column: 5, scope: !84)
!98 = !DILocation(line: 106, column: 5, scope: !84)
!99 = !DILocation(line: 109, column: 5, scope: !84)
!100 = !DILocation(line: 110, column: 5, scope: !84)
!101 = !DILocation(line: 111, column: 5, scope: !84)
!102 = !DILocation(line: 113, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 66, type: !16)
!105 = !DILocation(line: 66, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !12, line: 67, type: !20)
!107 = !DILocation(line: 67, column: 10, scope: !103)
!108 = !DILocation(line: 68, column: 12, scope: !103)
!109 = !DILocation(line: 68, column: 10, scope: !103)
!110 = !DILocation(line: 69, column: 26, scope: !103)
!111 = !DILocation(line: 69, column: 12, scope: !103)
!112 = !DILocation(line: 69, column: 10, scope: !103)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 71, type: !31)
!114 = distinct !DILexicalBlock(scope: !103, file: !12, line: 70, column: 5)
!115 = !DILocation(line: 71, column: 14, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !114, file: !12, line: 72, type: !36)
!117 = !DILocation(line: 72, column: 16, scope: !114)
!118 = !DILocalVariable(name: "dataLen", scope: !114, file: !12, line: 72, type: !36)
!119 = !DILocation(line: 72, column: 19, scope: !114)
!120 = !DILocation(line: 73, column: 26, scope: !114)
!121 = !DILocation(line: 73, column: 19, scope: !114)
!122 = !DILocation(line: 73, column: 17, scope: !114)
!123 = !DILocation(line: 75, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !12, line: 75, column: 9)
!125 = !DILocation(line: 75, column: 14, scope: !124)
!126 = !DILocation(line: 75, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 75, column: 9)
!128 = !DILocation(line: 75, column: 25, scope: !127)
!129 = !DILocation(line: 75, column: 23, scope: !127)
!130 = !DILocation(line: 75, column: 9, scope: !124)
!131 = !DILocation(line: 77, column: 23, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !12, line: 76, column: 9)
!133 = !DILocation(line: 77, column: 28, scope: !132)
!134 = !DILocation(line: 77, column: 18, scope: !132)
!135 = !DILocation(line: 77, column: 13, scope: !132)
!136 = !DILocation(line: 77, column: 21, scope: !132)
!137 = !DILocation(line: 78, column: 9, scope: !132)
!138 = !DILocation(line: 75, column: 35, scope: !127)
!139 = !DILocation(line: 75, column: 9, scope: !127)
!140 = distinct !{!140, !130, !141, !64}
!141 = !DILocation(line: 78, column: 9, scope: !124)
!142 = !DILocation(line: 79, column: 9, scope: !114)
!143 = !DILocation(line: 79, column: 20, scope: !114)
!144 = !DILocation(line: 80, column: 19, scope: !114)
!145 = !DILocation(line: 80, column: 9, scope: !114)
!146 = !DILocation(line: 82, column: 1, scope: !103)
!147 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 55, type: !71, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", arg: 1, scope: !147, file: !12, line: 55, type: !16)
!149 = !DILocation(line: 55, column: 36, scope: !147)
!150 = !DILocation(line: 58, column: 12, scope: !147)
!151 = !DILocation(line: 58, column: 5, scope: !147)
!152 = !DILocation(line: 59, column: 5, scope: !147)
!153 = !DILocation(line: 59, column: 16, scope: !147)
!154 = !DILocation(line: 60, column: 12, scope: !147)
!155 = !DILocation(line: 60, column: 5, scope: !147)
