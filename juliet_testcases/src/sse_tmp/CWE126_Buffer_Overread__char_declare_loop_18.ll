; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  br label %source, !dbg !35

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !36), !dbg !37
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay3, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx5, align 1, !dbg !52
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !54
  store i64 %call, i64* %destLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %source
  %0 = load i64, i64* %i, align 8, !dbg !59
  %1 = load i64, i64* %destLen, align 8, !dbg !61
  %cmp = icmp ult i64 %0, %1, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !64
  %3 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !64
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !64
  %5 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !68
  store i8 %4, i8* %arrayidx8, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %6, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx9, align 1, !dbg !77
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !78
  call void @printLine(i8* %arraydecay10), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_18_good() #0 !dbg !81 {
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
  call void @CWE126_Buffer_Overread__char_declare_loop_18_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__char_declare_loop_18_bad(), !dbg !100
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
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !110
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !113
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx2, align 1, !dbg !115
  br label %source, !dbg !116

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !117), !dbg !118
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i8* %arraydecay3, i8** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !128
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx5, align 1, !dbg !130
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !132
  store i64 %call, i64* %destLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %source
  %0 = load i64, i64* %i, align 8, !dbg !137
  %1 = load i64, i64* %destLen, align 8, !dbg !139
  %cmp = icmp ult i64 %0, %1, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !142
  %3 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !142
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !142
  %5 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !146
  store i8 %4, i8* %arrayidx8, align 1, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %6, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !153
  store i8 0, i8* %arrayidx9, align 1, !dbg !154
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !155
  call void @printLine(i8* %arraydecay10), !dbg !156
  ret void, !dbg !157
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 32, column: 5, scope: !11)
!36 = !DILabel(scope: !11, name: "source", file: !12, line: 33)
!37 = !DILocation(line: 33, column: 1, scope: !11)
!38 = !DILocation(line: 35, column: 12, scope: !11)
!39 = !DILocation(line: 35, column: 10, scope: !11)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 37, type: !42)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 37, column: 16, scope: !41)
!46 = !DILocalVariable(name: "destLen", scope: !41, file: !12, line: 37, type: !42)
!47 = !DILocation(line: 37, column: 19, scope: !41)
!48 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 38, type: !25)
!49 = !DILocation(line: 38, column: 14, scope: !41)
!50 = !DILocation(line: 39, column: 9, scope: !41)
!51 = !DILocation(line: 40, column: 9, scope: !41)
!52 = !DILocation(line: 40, column: 21, scope: !41)
!53 = !DILocation(line: 41, column: 26, scope: !41)
!54 = !DILocation(line: 41, column: 19, scope: !41)
!55 = !DILocation(line: 41, column: 17, scope: !41)
!56 = !DILocation(line: 44, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !12, line: 44, column: 9)
!58 = !DILocation(line: 44, column: 14, scope: !57)
!59 = !DILocation(line: 44, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 44, column: 9)
!61 = !DILocation(line: 44, column: 25, scope: !60)
!62 = !DILocation(line: 44, column: 23, scope: !60)
!63 = !DILocation(line: 44, column: 9, scope: !57)
!64 = !DILocation(line: 46, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !12, line: 45, column: 9)
!66 = !DILocation(line: 46, column: 28, scope: !65)
!67 = !DILocation(line: 46, column: 18, scope: !65)
!68 = !DILocation(line: 46, column: 13, scope: !65)
!69 = !DILocation(line: 46, column: 21, scope: !65)
!70 = !DILocation(line: 47, column: 9, scope: !65)
!71 = !DILocation(line: 44, column: 35, scope: !60)
!72 = !DILocation(line: 44, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 47, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 48, column: 9, scope: !41)
!77 = !DILocation(line: 48, column: 21, scope: !41)
!78 = !DILocation(line: 49, column: 19, scope: !41)
!79 = !DILocation(line: 49, column: 9, scope: !41)
!80 = !DILocation(line: 51, column: 1, scope: !11)
!81 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_18_good", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 90, column: 5, scope: !81)
!83 = !DILocation(line: 91, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !85, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 103, type: !87)
!90 = !DILocation(line: 103, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 103, type: !88)
!92 = !DILocation(line: 103, column: 27, scope: !84)
!93 = !DILocation(line: 106, column: 22, scope: !84)
!94 = !DILocation(line: 106, column: 12, scope: !84)
!95 = !DILocation(line: 106, column: 5, scope: !84)
!96 = !DILocation(line: 108, column: 5, scope: !84)
!97 = !DILocation(line: 109, column: 5, scope: !84)
!98 = !DILocation(line: 110, column: 5, scope: !84)
!99 = !DILocation(line: 113, column: 5, scope: !84)
!100 = !DILocation(line: 114, column: 5, scope: !84)
!101 = !DILocation(line: 115, column: 5, scope: !84)
!102 = !DILocation(line: 117, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 60, type: !16)
!105 = !DILocation(line: 60, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 61, type: !20)
!107 = !DILocation(line: 61, column: 10, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 62, type: !25)
!109 = !DILocation(line: 62, column: 10, scope: !103)
!110 = !DILocation(line: 63, column: 5, scope: !103)
!111 = !DILocation(line: 64, column: 5, scope: !103)
!112 = !DILocation(line: 64, column: 25, scope: !103)
!113 = !DILocation(line: 65, column: 5, scope: !103)
!114 = !DILocation(line: 66, column: 5, scope: !103)
!115 = !DILocation(line: 66, column: 27, scope: !103)
!116 = !DILocation(line: 67, column: 5, scope: !103)
!117 = !DILabel(scope: !103, name: "source", file: !12, line: 68)
!118 = !DILocation(line: 68, column: 1, scope: !103)
!119 = !DILocation(line: 70, column: 12, scope: !103)
!120 = !DILocation(line: 70, column: 10, scope: !103)
!121 = !DILocalVariable(name: "i", scope: !122, file: !12, line: 72, type: !42)
!122 = distinct !DILexicalBlock(scope: !103, file: !12, line: 71, column: 5)
!123 = !DILocation(line: 72, column: 16, scope: !122)
!124 = !DILocalVariable(name: "destLen", scope: !122, file: !12, line: 72, type: !42)
!125 = !DILocation(line: 72, column: 19, scope: !122)
!126 = !DILocalVariable(name: "dest", scope: !122, file: !12, line: 73, type: !25)
!127 = !DILocation(line: 73, column: 14, scope: !122)
!128 = !DILocation(line: 74, column: 9, scope: !122)
!129 = !DILocation(line: 75, column: 9, scope: !122)
!130 = !DILocation(line: 75, column: 21, scope: !122)
!131 = !DILocation(line: 76, column: 26, scope: !122)
!132 = !DILocation(line: 76, column: 19, scope: !122)
!133 = !DILocation(line: 76, column: 17, scope: !122)
!134 = !DILocation(line: 79, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !122, file: !12, line: 79, column: 9)
!136 = !DILocation(line: 79, column: 14, scope: !135)
!137 = !DILocation(line: 79, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 79, column: 9)
!139 = !DILocation(line: 79, column: 25, scope: !138)
!140 = !DILocation(line: 79, column: 23, scope: !138)
!141 = !DILocation(line: 79, column: 9, scope: !135)
!142 = !DILocation(line: 81, column: 23, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !12, line: 80, column: 9)
!144 = !DILocation(line: 81, column: 28, scope: !143)
!145 = !DILocation(line: 81, column: 18, scope: !143)
!146 = !DILocation(line: 81, column: 13, scope: !143)
!147 = !DILocation(line: 81, column: 21, scope: !143)
!148 = !DILocation(line: 82, column: 9, scope: !143)
!149 = !DILocation(line: 79, column: 35, scope: !138)
!150 = !DILocation(line: 79, column: 9, scope: !138)
!151 = distinct !{!151, !141, !152, !75}
!152 = !DILocation(line: 82, column: 9, scope: !135)
!153 = !DILocation(line: 83, column: 9, scope: !122)
!154 = !DILocation(line: 83, column: 21, scope: !122)
!155 = !DILocation(line: 84, column: 19, scope: !122)
!156 = !DILocation(line: 84, column: 9, scope: !122)
!157 = !DILocation(line: 86, column: 1, scope: !103)
