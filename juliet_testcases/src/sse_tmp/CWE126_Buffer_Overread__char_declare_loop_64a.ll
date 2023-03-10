; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_64a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_64a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_64_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
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
  %0 = bitcast i8** %data to i8*, !dbg !37
  call void @CWE126_Buffer_Overread__char_declare_loop_64b_badSink(i8* %0), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @CWE126_Buffer_Overread__char_declare_loop_64b_badSink(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_64_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #5, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #5, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE126_Buffer_Overread__char_declare_loop_64_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE126_Buffer_Overread__char_declare_loop_64_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !69
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !70
  store i8 0, i8* %arrayidx, align 1, !dbg !71
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !72
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !73
  store i8 0, i8* %arrayidx2, align 1, !dbg !74
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !75
  store i8* %arraydecay3, i8** %data, align 8, !dbg !76
  %0 = bitcast i8** %data to i8*, !dbg !77
  call void @CWE126_Buffer_Overread__char_declare_loop_64b_goodG2BSink(i8* %0), !dbg !78
  ret void, !dbg !79
}

declare dso_local void @CWE126_Buffer_Overread__char_declare_loop_64b_goodG2BSink(i8*) #3

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_64a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_64_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_64a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 28, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 29, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 29, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 30, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 30, column: 10, scope: !11)
!29 = !DILocation(line: 31, column: 5, scope: !11)
!30 = !DILocation(line: 32, column: 5, scope: !11)
!31 = !DILocation(line: 32, column: 25, scope: !11)
!32 = !DILocation(line: 33, column: 5, scope: !11)
!33 = !DILocation(line: 34, column: 5, scope: !11)
!34 = !DILocation(line: 34, column: 27, scope: !11)
!35 = !DILocation(line: 36, column: 12, scope: !11)
!36 = !DILocation(line: 36, column: 10, scope: !11)
!37 = !DILocation(line: 37, column: 59, scope: !11)
!38 = !DILocation(line: 37, column: 5, scope: !11)
!39 = !DILocation(line: 38, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_64_good", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 63, column: 5, scope: !40)
!42 = !DILocation(line: 64, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 76, type: !44, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 76, type: !46)
!49 = !DILocation(line: 76, column: 14, scope: !43)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 76, type: !47)
!51 = !DILocation(line: 76, column: 27, scope: !43)
!52 = !DILocation(line: 79, column: 22, scope: !43)
!53 = !DILocation(line: 79, column: 12, scope: !43)
!54 = !DILocation(line: 79, column: 5, scope: !43)
!55 = !DILocation(line: 81, column: 5, scope: !43)
!56 = !DILocation(line: 82, column: 5, scope: !43)
!57 = !DILocation(line: 83, column: 5, scope: !43)
!58 = !DILocation(line: 86, column: 5, scope: !43)
!59 = !DILocation(line: 87, column: 5, scope: !43)
!60 = !DILocation(line: 88, column: 5, scope: !43)
!61 = !DILocation(line: 90, column: 5, scope: !43)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !12, line: 49, type: !16)
!64 = !DILocation(line: 49, column: 12, scope: !62)
!65 = !DILocalVariable(name: "dataBadBuffer", scope: !62, file: !12, line: 50, type: !20)
!66 = !DILocation(line: 50, column: 10, scope: !62)
!67 = !DILocalVariable(name: "dataGoodBuffer", scope: !62, file: !12, line: 51, type: !25)
!68 = !DILocation(line: 51, column: 10, scope: !62)
!69 = !DILocation(line: 52, column: 5, scope: !62)
!70 = !DILocation(line: 53, column: 5, scope: !62)
!71 = !DILocation(line: 53, column: 25, scope: !62)
!72 = !DILocation(line: 54, column: 5, scope: !62)
!73 = !DILocation(line: 55, column: 5, scope: !62)
!74 = !DILocation(line: 55, column: 27, scope: !62)
!75 = !DILocation(line: 57, column: 12, scope: !62)
!76 = !DILocation(line: 57, column: 10, scope: !62)
!77 = !DILocation(line: 58, column: 63, scope: !62)
!78 = !DILocation(line: 58, column: 5, scope: !62)
!79 = !DILocation(line: 59, column: 1, scope: !62)
