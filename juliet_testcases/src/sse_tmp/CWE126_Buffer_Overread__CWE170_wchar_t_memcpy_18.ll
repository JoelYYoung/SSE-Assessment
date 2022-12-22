; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  br label %sink, !dbg !15

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !16), !dbg !17
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !18, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !32
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !33
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !36
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !36
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !36
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !37
  call void @printWLine(i32* %arraydecay3), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18_good() #0 !dbg !40 {
entry:
  call void @good1(), !dbg !41
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #5, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #5, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !63 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  br label %sink, !dbg !64

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !65), !dbg !66
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !67, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !72
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !73
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !76
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !76
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !76
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx3, align 4, !dbg !78
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !79
  call void @printWLine(i32* %arraydecay4), !dbg !80
  ret void, !dbg !81
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 5, scope: !11)
!16 = !DILabel(scope: !11, name: "sink", file: !12, line: 25)
!17 = !DILocation(line: 25, column: 1, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 27, type: !20)
!19 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 4800, elements: !24)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !23)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !{!25}
!25 = !DISubrange(count: 150)
!26 = !DILocation(line: 27, column: 17, scope: !19)
!27 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 27, column: 28, scope: !19)
!32 = !DILocation(line: 29, column: 17, scope: !19)
!33 = !DILocation(line: 29, column: 9, scope: !19)
!34 = !DILocation(line: 30, column: 9, scope: !19)
!35 = !DILocation(line: 30, column: 19, scope: !19)
!36 = !DILocation(line: 31, column: 9, scope: !19)
!37 = !DILocation(line: 33, column: 20, scope: !19)
!38 = !DILocation(line: 33, column: 9, scope: !19)
!39 = !DILocation(line: 35, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_18_good", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 59, column: 5, scope: !40)
!42 = !DILocation(line: 60, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 71, type: !44, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!23, !23, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 71, type: !23)
!50 = !DILocation(line: 71, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 71, type: !46)
!52 = !DILocation(line: 71, column: 27, scope: !43)
!53 = !DILocation(line: 74, column: 22, scope: !43)
!54 = !DILocation(line: 74, column: 12, scope: !43)
!55 = !DILocation(line: 74, column: 5, scope: !43)
!56 = !DILocation(line: 76, column: 5, scope: !43)
!57 = !DILocation(line: 77, column: 5, scope: !43)
!58 = !DILocation(line: 78, column: 5, scope: !43)
!59 = !DILocation(line: 81, column: 5, scope: !43)
!60 = !DILocation(line: 82, column: 5, scope: !43)
!61 = !DILocation(line: 83, column: 5, scope: !43)
!62 = !DILocation(line: 85, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 44, column: 5, scope: !63)
!65 = !DILabel(scope: !63, name: "sink", file: !12, line: 45)
!66 = !DILocation(line: 45, column: 1, scope: !63)
!67 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 47, type: !20)
!68 = distinct !DILexicalBlock(scope: !63, file: !12, line: 46, column: 5)
!69 = !DILocation(line: 47, column: 17, scope: !68)
!70 = !DILocalVariable(name: "dest", scope: !68, file: !12, line: 47, type: !28)
!71 = !DILocation(line: 47, column: 28, scope: !68)
!72 = !DILocation(line: 49, column: 17, scope: !68)
!73 = !DILocation(line: 49, column: 9, scope: !68)
!74 = !DILocation(line: 50, column: 9, scope: !68)
!75 = !DILocation(line: 50, column: 19, scope: !68)
!76 = !DILocation(line: 51, column: 9, scope: !68)
!77 = !DILocation(line: 52, column: 9, scope: !68)
!78 = !DILocation(line: 52, column: 18, scope: !68)
!79 = !DILocation(line: 53, column: 20, scope: !68)
!80 = !DILocation(line: 53, column: 9, scope: !68)
!81 = !DILocation(line: 55, column: 1, scope: !63)
