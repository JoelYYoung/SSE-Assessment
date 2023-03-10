; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_68a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__char_declare_loop_68_badData = dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__char_declare_loop_68_goodG2BData = dso_local global i8* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !37
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx2, align 1, !dbg !39
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay3, i8** %data, align 8, !dbg !41
  %0 = load i8*, i8** %data, align 8, !dbg !42
  store i8* %0, i8** @CWE126_Buffer_Overread__char_declare_loop_68_badData, align 8, !dbg !43
  call void (...) @CWE126_Buffer_Overread__char_declare_loop_68b_badSink(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @CWE126_Buffer_Overread__char_declare_loop_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_68_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__char_declare_loop_68_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__char_declare_loop_68_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !75
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !78
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx2, align 1, !dbg !80
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !81
  store i8* %arraydecay3, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  store i8* %0, i8** @CWE126_Buffer_Overread__char_declare_loop_68_goodG2BData, align 8, !dbg !84
  call void (...) @CWE126_Buffer_Overread__char_declare_loop_68b_goodG2BSink(), !dbg !85
  ret void, !dbg !86
}

declare dso_local void @CWE126_Buffer_Overread__char_declare_loop_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_declare_loop_68_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_declare_loop_68_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_68_bad", scope: !10, file: !10, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 31, type: !11)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !10, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 32, column: 10, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !10, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 33, column: 10, scope: !19)
!34 = !DILocation(line: 34, column: 5, scope: !19)
!35 = !DILocation(line: 35, column: 5, scope: !19)
!36 = !DILocation(line: 35, column: 25, scope: !19)
!37 = !DILocation(line: 36, column: 5, scope: !19)
!38 = !DILocation(line: 37, column: 5, scope: !19)
!39 = !DILocation(line: 37, column: 27, scope: !19)
!40 = !DILocation(line: 39, column: 12, scope: !19)
!41 = !DILocation(line: 39, column: 10, scope: !19)
!42 = !DILocation(line: 40, column: 60, scope: !19)
!43 = !DILocation(line: 40, column: 58, scope: !19)
!44 = !DILocation(line: 41, column: 5, scope: !19)
!45 = !DILocation(line: 42, column: 1, scope: !19)
!46 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_68_good", scope: !10, file: !10, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DILocation(line: 69, column: 5, scope: !46)
!48 = !DILocation(line: 70, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 82, type: !50, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !10, line: 82, type: !52)
!55 = !DILocation(line: 82, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !10, line: 82, type: !53)
!57 = !DILocation(line: 82, column: 27, scope: !49)
!58 = !DILocation(line: 85, column: 22, scope: !49)
!59 = !DILocation(line: 85, column: 12, scope: !49)
!60 = !DILocation(line: 85, column: 5, scope: !49)
!61 = !DILocation(line: 87, column: 5, scope: !49)
!62 = !DILocation(line: 88, column: 5, scope: !49)
!63 = !DILocation(line: 89, column: 5, scope: !49)
!64 = !DILocation(line: 92, column: 5, scope: !49)
!65 = !DILocation(line: 93, column: 5, scope: !49)
!66 = !DILocation(line: 94, column: 5, scope: !49)
!67 = !DILocation(line: 96, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !10, line: 54, type: !11)
!70 = !DILocation(line: 54, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !68, file: !10, line: 55, type: !25)
!72 = !DILocation(line: 55, column: 10, scope: !68)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !68, file: !10, line: 56, type: !30)
!74 = !DILocation(line: 56, column: 10, scope: !68)
!75 = !DILocation(line: 57, column: 5, scope: !68)
!76 = !DILocation(line: 58, column: 5, scope: !68)
!77 = !DILocation(line: 58, column: 25, scope: !68)
!78 = !DILocation(line: 59, column: 5, scope: !68)
!79 = !DILocation(line: 60, column: 5, scope: !68)
!80 = !DILocation(line: 60, column: 27, scope: !68)
!81 = !DILocation(line: 62, column: 12, scope: !68)
!82 = !DILocation(line: 62, column: 10, scope: !68)
!83 = !DILocation(line: 63, column: 64, scope: !68)
!84 = !DILocation(line: 63, column: 62, scope: !68)
!85 = !DILocation(line: 64, column: 5, scope: !68)
!86 = !DILocation(line: 65, column: 1, scope: !68)
