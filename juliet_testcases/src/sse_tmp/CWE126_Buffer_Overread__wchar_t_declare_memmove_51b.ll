; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_51b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_51b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !25
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !26
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !29
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !29
  %1 = load i32*, i32** %data.addr, align 8, !dbg !30
  %2 = bitcast i32* %1 to i8*, !dbg !29
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !32
  %mul = mul i64 %call3, 4, !dbg !33
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !29
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx4, align 4, !dbg !35
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  call void @printWLine(i32* %arraydecay5), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_51b_goodG2BSink(i32* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !49
  %1 = load i32*, i32** %data.addr, align 8, !dbg !50
  %2 = bitcast i32* %1 to i8*, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !52
  %mul = mul i64 %call3, 4, !dbg !53
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !49
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx4, align 4, !dbg !55
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay5), !dbg !57
  ret void, !dbg !58
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_51b_badSink", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 25, type: !13)
!18 = !DILocation(line: 25, column: 76, scope: !9)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !10, line: 28, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 3200, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 28, column: 17, scope: !20)
!25 = !DILocation(line: 29, column: 17, scope: !20)
!26 = !DILocation(line: 29, column: 9, scope: !20)
!27 = !DILocation(line: 30, column: 9, scope: !20)
!28 = !DILocation(line: 30, column: 21, scope: !20)
!29 = !DILocation(line: 33, column: 9, scope: !20)
!30 = !DILocation(line: 33, column: 23, scope: !20)
!31 = !DILocation(line: 33, column: 36, scope: !20)
!32 = !DILocation(line: 33, column: 29, scope: !20)
!33 = !DILocation(line: 33, column: 41, scope: !20)
!34 = !DILocation(line: 34, column: 9, scope: !20)
!35 = !DILocation(line: 34, column: 21, scope: !20)
!36 = !DILocation(line: 35, column: 20, scope: !20)
!37 = !DILocation(line: 35, column: 9, scope: !20)
!38 = !DILocation(line: 37, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_51b_goodG2BSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !10, line: 44, type: !13)
!41 = !DILocation(line: 44, column: 80, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !10, line: 47, type: !21)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 46, column: 5)
!44 = !DILocation(line: 47, column: 17, scope: !43)
!45 = !DILocation(line: 48, column: 17, scope: !43)
!46 = !DILocation(line: 48, column: 9, scope: !43)
!47 = !DILocation(line: 49, column: 9, scope: !43)
!48 = !DILocation(line: 49, column: 21, scope: !43)
!49 = !DILocation(line: 52, column: 9, scope: !43)
!50 = !DILocation(line: 52, column: 23, scope: !43)
!51 = !DILocation(line: 52, column: 36, scope: !43)
!52 = !DILocation(line: 52, column: 29, scope: !43)
!53 = !DILocation(line: 52, column: 41, scope: !43)
!54 = !DILocation(line: 53, column: 9, scope: !43)
!55 = !DILocation(line: 53, column: 21, scope: !43)
!56 = !DILocation(line: 54, column: 20, scope: !43)
!57 = !DILocation(line: 54, column: 9, scope: !43)
!58 = !DILocation(line: 56, column: 1, scope: !39)
