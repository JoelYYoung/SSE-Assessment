; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data4 = alloca i8*, align 8
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
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay3, i8** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = load i8*, i8** %data, align 8, !dbg !40
  store i8* %0, i8** %dataCopy, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !41, metadata !DIExpression()), !dbg !42
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !43
  store i8* %1, i8** %data4, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !54
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx6, align 1, !dbg !56
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  %call = call i64 @strlen(i8* %arraydecay7) #6, !dbg !58
  store i64 %call, i64* %destLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !63
  %3 = load i64, i64* %destLen, align 8, !dbg !65
  %cmp = icmp ult i64 %2, %3, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data4, align 8, !dbg !68
  %5 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx8 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !68
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !68
  %7 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !72
  store i8 %6, i8* %arrayidx9, align 1, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %8, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !80
  store i8 0, i8* %arrayidx10, align 1, !dbg !81
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !82
  call void @printLine(i8* %arraydecay11), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_31_good() #0 !dbg !85 {
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
  call void @CWE126_Buffer_Overread__char_declare_loop_31_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__char_declare_loop_31_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data4 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !114
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !117
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx2, align 1, !dbg !119
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  store i8* %arraydecay3, i8** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !122, metadata !DIExpression()), !dbg !124
  %0 = load i8*, i8** %data, align 8, !dbg !125
  store i8* %0, i8** %dataCopy, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !126, metadata !DIExpression()), !dbg !127
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !128
  store i8* %1, i8** %data4, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !136
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !137
  store i8 0, i8* %arrayidx6, align 1, !dbg !138
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  %call = call i64 @strlen(i8* %arraydecay7) #6, !dbg !140
  store i64 %call, i64* %destLen, align 8, !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !145
  %3 = load i64, i64* %destLen, align 8, !dbg !147
  %cmp = icmp ult i64 %2, %3, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data4, align 8, !dbg !150
  %5 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx8 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !150
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !150
  %7 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !154
  store i8 %6, i8* %arrayidx9, align 1, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %8, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !161
  store i8 0, i8* %arrayidx10, align 1, !dbg !162
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !163
  call void @printLine(i8* %arraydecay11), !dbg !164
  ret void, !dbg !165
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_31.c", directory: "/root/SSE-Assessment")
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
!35 = !DILocation(line: 33, column: 12, scope: !11)
!36 = !DILocation(line: 33, column: 10, scope: !11)
!37 = !DILocalVariable(name: "dataCopy", scope: !38, file: !12, line: 35, type: !16)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!39 = !DILocation(line: 35, column: 16, scope: !38)
!40 = !DILocation(line: 35, column: 27, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !12, line: 36, type: !16)
!42 = !DILocation(line: 36, column: 16, scope: !38)
!43 = !DILocation(line: 36, column: 23, scope: !38)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 38, type: !46)
!45 = distinct !DILexicalBlock(scope: !38, file: !12, line: 37, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 38, column: 20, scope: !45)
!50 = !DILocalVariable(name: "destLen", scope: !45, file: !12, line: 38, type: !46)
!51 = !DILocation(line: 38, column: 23, scope: !45)
!52 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 39, type: !25)
!53 = !DILocation(line: 39, column: 18, scope: !45)
!54 = !DILocation(line: 40, column: 13, scope: !45)
!55 = !DILocation(line: 41, column: 13, scope: !45)
!56 = !DILocation(line: 41, column: 25, scope: !45)
!57 = !DILocation(line: 42, column: 30, scope: !45)
!58 = !DILocation(line: 42, column: 23, scope: !45)
!59 = !DILocation(line: 42, column: 21, scope: !45)
!60 = !DILocation(line: 45, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !45, file: !12, line: 45, column: 13)
!62 = !DILocation(line: 45, column: 18, scope: !61)
!63 = !DILocation(line: 45, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !12, line: 45, column: 13)
!65 = !DILocation(line: 45, column: 29, scope: !64)
!66 = !DILocation(line: 45, column: 27, scope: !64)
!67 = !DILocation(line: 45, column: 13, scope: !61)
!68 = !DILocation(line: 47, column: 27, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !12, line: 46, column: 13)
!70 = !DILocation(line: 47, column: 32, scope: !69)
!71 = !DILocation(line: 47, column: 22, scope: !69)
!72 = !DILocation(line: 47, column: 17, scope: !69)
!73 = !DILocation(line: 47, column: 25, scope: !69)
!74 = !DILocation(line: 48, column: 13, scope: !69)
!75 = !DILocation(line: 45, column: 39, scope: !64)
!76 = !DILocation(line: 45, column: 13, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 48, column: 13, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 49, column: 13, scope: !45)
!81 = !DILocation(line: 49, column: 25, scope: !45)
!82 = !DILocation(line: 50, column: 23, scope: !45)
!83 = !DILocation(line: 50, column: 13, scope: !45)
!84 = !DILocation(line: 53, column: 1, scope: !11)
!85 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_31_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 94, column: 5, scope: !85)
!87 = !DILocation(line: 95, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !89, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !12, line: 106, type: !91)
!94 = !DILocation(line: 106, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !12, line: 106, type: !92)
!96 = !DILocation(line: 106, column: 27, scope: !88)
!97 = !DILocation(line: 109, column: 22, scope: !88)
!98 = !DILocation(line: 109, column: 12, scope: !88)
!99 = !DILocation(line: 109, column: 5, scope: !88)
!100 = !DILocation(line: 111, column: 5, scope: !88)
!101 = !DILocation(line: 112, column: 5, scope: !88)
!102 = !DILocation(line: 113, column: 5, scope: !88)
!103 = !DILocation(line: 116, column: 5, scope: !88)
!104 = !DILocation(line: 117, column: 5, scope: !88)
!105 = !DILocation(line: 118, column: 5, scope: !88)
!106 = !DILocation(line: 120, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 62, type: !16)
!109 = !DILocation(line: 62, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !12, line: 63, type: !20)
!111 = !DILocation(line: 63, column: 10, scope: !107)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !12, line: 64, type: !25)
!113 = !DILocation(line: 64, column: 10, scope: !107)
!114 = !DILocation(line: 65, column: 5, scope: !107)
!115 = !DILocation(line: 66, column: 5, scope: !107)
!116 = !DILocation(line: 66, column: 25, scope: !107)
!117 = !DILocation(line: 67, column: 5, scope: !107)
!118 = !DILocation(line: 68, column: 5, scope: !107)
!119 = !DILocation(line: 68, column: 27, scope: !107)
!120 = !DILocation(line: 70, column: 12, scope: !107)
!121 = !DILocation(line: 70, column: 10, scope: !107)
!122 = !DILocalVariable(name: "dataCopy", scope: !123, file: !12, line: 72, type: !16)
!123 = distinct !DILexicalBlock(scope: !107, file: !12, line: 71, column: 5)
!124 = !DILocation(line: 72, column: 16, scope: !123)
!125 = !DILocation(line: 72, column: 27, scope: !123)
!126 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 73, type: !16)
!127 = !DILocation(line: 73, column: 16, scope: !123)
!128 = !DILocation(line: 73, column: 23, scope: !123)
!129 = !DILocalVariable(name: "i", scope: !130, file: !12, line: 75, type: !46)
!130 = distinct !DILexicalBlock(scope: !123, file: !12, line: 74, column: 9)
!131 = !DILocation(line: 75, column: 20, scope: !130)
!132 = !DILocalVariable(name: "destLen", scope: !130, file: !12, line: 75, type: !46)
!133 = !DILocation(line: 75, column: 23, scope: !130)
!134 = !DILocalVariable(name: "dest", scope: !130, file: !12, line: 76, type: !25)
!135 = !DILocation(line: 76, column: 18, scope: !130)
!136 = !DILocation(line: 77, column: 13, scope: !130)
!137 = !DILocation(line: 78, column: 13, scope: !130)
!138 = !DILocation(line: 78, column: 25, scope: !130)
!139 = !DILocation(line: 79, column: 30, scope: !130)
!140 = !DILocation(line: 79, column: 23, scope: !130)
!141 = !DILocation(line: 79, column: 21, scope: !130)
!142 = !DILocation(line: 82, column: 20, scope: !143)
!143 = distinct !DILexicalBlock(scope: !130, file: !12, line: 82, column: 13)
!144 = !DILocation(line: 82, column: 18, scope: !143)
!145 = !DILocation(line: 82, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 82, column: 13)
!147 = !DILocation(line: 82, column: 29, scope: !146)
!148 = !DILocation(line: 82, column: 27, scope: !146)
!149 = !DILocation(line: 82, column: 13, scope: !143)
!150 = !DILocation(line: 84, column: 27, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !12, line: 83, column: 13)
!152 = !DILocation(line: 84, column: 32, scope: !151)
!153 = !DILocation(line: 84, column: 22, scope: !151)
!154 = !DILocation(line: 84, column: 17, scope: !151)
!155 = !DILocation(line: 84, column: 25, scope: !151)
!156 = !DILocation(line: 85, column: 13, scope: !151)
!157 = !DILocation(line: 82, column: 39, scope: !146)
!158 = !DILocation(line: 82, column: 13, scope: !146)
!159 = distinct !{!159, !149, !160, !79}
!160 = !DILocation(line: 85, column: 13, scope: !143)
!161 = !DILocation(line: 86, column: 13, scope: !130)
!162 = !DILocation(line: 86, column: 25, scope: !130)
!163 = !DILocation(line: 87, column: 23, scope: !130)
!164 = !DILocation(line: 87, column: 13, scope: !130)
!165 = !DILocation(line: 90, column: 1, scope: !107)
