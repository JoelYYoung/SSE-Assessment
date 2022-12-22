; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !39
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx5, align 1, !dbg !42
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %0 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !46
  %mul = mul i64 %call, 1, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !43
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx8, align 1, !dbg !49
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @printLine(i8* %arraydecay9), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_01_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #8, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #8, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__char_declare_memcpy_01_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__char_declare_memcpy_01_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !82
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !85
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx2, align 1, !dbg !87
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay3, i8** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !93
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx5, align 1, !dbg !95
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  %0 = load i8*, i8** %data, align 8, !dbg !97
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !99
  %mul = mul i64 %call, 1, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !96
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx8, align 1, !dbg !102
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @printLine(i8* %arraydecay9), !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_01.c", directory: "/root/SSE-Assessment")
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
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 35, type: !25)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!39 = !DILocation(line: 35, column: 14, scope: !38)
!40 = !DILocation(line: 36, column: 9, scope: !38)
!41 = !DILocation(line: 37, column: 9, scope: !38)
!42 = !DILocation(line: 37, column: 21, scope: !38)
!43 = !DILocation(line: 40, column: 9, scope: !38)
!44 = !DILocation(line: 40, column: 22, scope: !38)
!45 = !DILocation(line: 40, column: 35, scope: !38)
!46 = !DILocation(line: 40, column: 28, scope: !38)
!47 = !DILocation(line: 40, column: 40, scope: !38)
!48 = !DILocation(line: 41, column: 9, scope: !38)
!49 = !DILocation(line: 41, column: 21, scope: !38)
!50 = !DILocation(line: 42, column: 19, scope: !38)
!51 = !DILocation(line: 42, column: 9, scope: !38)
!52 = !DILocation(line: 44, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_01_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 76, column: 5, scope: !53)
!55 = !DILocation(line: 77, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !57, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 89, type: !59)
!62 = !DILocation(line: 89, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 89, type: !60)
!64 = !DILocation(line: 89, column: 27, scope: !56)
!65 = !DILocation(line: 92, column: 22, scope: !56)
!66 = !DILocation(line: 92, column: 12, scope: !56)
!67 = !DILocation(line: 92, column: 5, scope: !56)
!68 = !DILocation(line: 94, column: 5, scope: !56)
!69 = !DILocation(line: 95, column: 5, scope: !56)
!70 = !DILocation(line: 96, column: 5, scope: !56)
!71 = !DILocation(line: 99, column: 5, scope: !56)
!72 = !DILocation(line: 100, column: 5, scope: !56)
!73 = !DILocation(line: 101, column: 5, scope: !56)
!74 = !DILocation(line: 103, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 53, type: !16)
!77 = !DILocation(line: 53, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !12, line: 54, type: !20)
!79 = !DILocation(line: 54, column: 10, scope: !75)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !12, line: 55, type: !25)
!81 = !DILocation(line: 55, column: 10, scope: !75)
!82 = !DILocation(line: 56, column: 5, scope: !75)
!83 = !DILocation(line: 57, column: 5, scope: !75)
!84 = !DILocation(line: 57, column: 25, scope: !75)
!85 = !DILocation(line: 58, column: 5, scope: !75)
!86 = !DILocation(line: 59, column: 5, scope: !75)
!87 = !DILocation(line: 59, column: 27, scope: !75)
!88 = !DILocation(line: 61, column: 12, scope: !75)
!89 = !DILocation(line: 61, column: 10, scope: !75)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !12, line: 63, type: !25)
!91 = distinct !DILexicalBlock(scope: !75, file: !12, line: 62, column: 5)
!92 = !DILocation(line: 63, column: 14, scope: !91)
!93 = !DILocation(line: 64, column: 9, scope: !91)
!94 = !DILocation(line: 65, column: 9, scope: !91)
!95 = !DILocation(line: 65, column: 21, scope: !91)
!96 = !DILocation(line: 68, column: 9, scope: !91)
!97 = !DILocation(line: 68, column: 22, scope: !91)
!98 = !DILocation(line: 68, column: 35, scope: !91)
!99 = !DILocation(line: 68, column: 28, scope: !91)
!100 = !DILocation(line: 68, column: 40, scope: !91)
!101 = !DILocation(line: 69, column: 9, scope: !91)
!102 = !DILocation(line: 69, column: 21, scope: !91)
!103 = !DILocation(line: 70, column: 19, scope: !91)
!104 = !DILocation(line: 70, column: 9, scope: !91)
!105 = !DILocation(line: 72, column: 1, scope: !75)
